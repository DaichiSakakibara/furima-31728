FactoryBot.define do
  factory :item do
    title                { 'aaaaaaa' }
    text                 { Faker::Lorem.sentence }
    category_id          { 2 }
    item_status_id       { 2 }
    which_pay_id         { 2 }
    prefecture_id        { 2 }
    how_long_day_id      { 2 }
    price                { 1000 }
  end
end
