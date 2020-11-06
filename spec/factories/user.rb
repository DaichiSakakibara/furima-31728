FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    last_name             { person.last.kanji}
    first_name            { person.first.kanji }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.first.katakana }
    email                 { Faker::Internet.free_email }
    birth_day             { Date.new(2020, 11, 5) }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

  end
end
