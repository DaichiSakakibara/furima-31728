FactoryBot.define do
  factory :user_order do
    price                { 1000 }
    token {"tok_abcdefghijk00000000000000000"}
    post_number         { '123-4567' }
    prefecture_id      { 2 }
    municipality        { '札幌市' }
    address_number      { '1-1' }
    building_name       { '札幌ビル' }
    phone_number        { '09012345678' }
  end
end
