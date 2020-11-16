class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def user_order_params
    params.require(:user_order).permit(:post_number, :prefecture_id, :municipality, :address_number, :building_name, :phone_number).merge(token: params[:token], order_id: params[:order_id], item_id: params[:item_id], user_id: current_user.id, price: params[:price])
  end

  def pay_item
    Payjp.api_key = "sk_test_f70a562a5da00fd1c0ec50bc"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: user_order_params[:price],  # 商品の値段
      card: user_order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
     )
end

end
