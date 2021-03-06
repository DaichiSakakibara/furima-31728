class UserOrder

  include ActiveModel::Model
  attr_accessor :token, :post_number, :prefecture_id, :municipality, :address_number, :building_name, :phone_number, :item_id, :user_id, :order_id, :price
  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address_number
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "can be up to 11 digits"}
    validates :token
    validates :price
  end
  validates :prefecture_id,numericality: { other_than: 1 ,message: "must be other than 1"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id )
    Address.create(post_number: post_number, prefecture_id: prefecture_id, municipality: municipality, address_number: address_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
