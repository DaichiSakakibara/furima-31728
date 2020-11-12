class UserOrder

  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :post_number, :prefecture_id, :municipality, :address_number, :building_name, :phone_number
  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address_number
    validates :phone_number #format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id,numericality: { other_than: 1 ,message: "can't be blank"}

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている

    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, oder_id: order.id)
    # 寄付金の情報を保存
    Order.create(item_id: item.id, user_id: user.id)
  end
end