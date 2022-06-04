class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save

      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = find_record(params[:id])
  end

  def edit
    @item = find_record(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = find_record(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipment_fee_id, :prefecture_id,
                                 :lead_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_record(id)
    return Item.find(id)
  end
end
