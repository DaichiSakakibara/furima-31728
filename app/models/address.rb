class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :post_number
    validates :municipality
    validates :address_number
    validates :phone_number 
  end

  validates :prefecture_id,numericality: { other_than: 1 }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
