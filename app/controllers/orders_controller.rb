class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index, :create]
  before_action :user_item_check, only: [:index]
  before_action :inventory_check, only: [:index]

  def index
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(shipment_params)
    if @order_shipment.valid?
      pay_item
      @order_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipment_params
    params.require(:order_shipment).permit(:zip_code, :prefecture_id, :city, :branch, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_item_check
    redirect_to root_path if current_user.id == @item.user_id
  end

  def inventory_check
    redirect_to root_path if @order = Order.find_by(item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(shipment_params[:item_id]).price,
      card: shipment_params[:token],
      currency: 'jpy'
    )
  end
end