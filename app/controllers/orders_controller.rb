class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      @user_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def user_order_params
    params.require(:user_order).permit(:post_number, :prefecture_id, :municipality, :address_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

end
