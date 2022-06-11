class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(shipment_params)
    if @order_shipment.valid?
      @order_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipment_params
    params.require(:order_shipment).permit(:zip_code, :prefecture_id, :city, :branch, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end