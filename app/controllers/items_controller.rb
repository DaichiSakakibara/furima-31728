class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
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
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to items_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

   def destroy
    if current_user.id != @item.user.id
      redirect_to items_path
    else
    @item.destroy
      redirect_to root_path
    end
  end

  def calculation
    price = Item.new(params[:price])
    render json: { price: price }
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :item_status_id, :which_pay_id, :prefecture_id, :how_long_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
