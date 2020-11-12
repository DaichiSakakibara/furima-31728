class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :item
  has_one :address
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
