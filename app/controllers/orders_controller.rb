class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create ]
  before_action :order_confirmation, only: [:index, :create ]
  before_action :authenticate_user!

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def user_order_params
    params.require(:user_order).permit(:post_number, :prefecture_id, :municipality, :address_number, :building_name, :phone_number).merge(token: params[:token], order_id: params[:order_id], item_id: params[:item_id], user_id: current_user.id, price: params[:price])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: user_order_params[:price],  # 商品の値段
      card: user_order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
     )
end

def set_item
  @item = Item.find(params[:item_id])
end

def order_confirmation
  redirect_to root_path if current_user == @item.user || @item.order
end

end
