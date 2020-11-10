class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC').includes(:user)
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
    @item = Item.find(params[:id])
  end

  # def edit
    # @item = Item.find(params[:id])
  # end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  def calculation
    price = Item.new(params[:price])
    render json: { price: price }
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :item_status_id, :which_pay_id, :prefecture_id, :how_long_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to items_path unless user_signed_in?
  end
end
