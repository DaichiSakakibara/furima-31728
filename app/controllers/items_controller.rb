class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

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

  private

  def prototype_params
    params.require(:item).permit(:title, :text, :category_id, :item_status_id, :which_pay_id, :prefectures_id, :how_long_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
