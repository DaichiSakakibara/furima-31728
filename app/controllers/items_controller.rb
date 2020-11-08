class ItemsController < ApplicationController
  before_action :move_to_session

  def index
    @items = Item.all
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

  def calculation
    price = Item.new(params[:price])
    render json:{ price: price }
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :item_status_id, :which_pay_id, :prefectures_id, :how_long_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_session
    redirect_to "/users/sign_in" unless user_signed_in?
  end
end
