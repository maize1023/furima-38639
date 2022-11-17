FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number:2)}
    birth_date            {Faker::Date.backward }
    kanji_last_name       {Faker::Name.last_name}
    kana_first_name2      {Faker::Name.first_name}
    kana_last_name        {Faker::Name.last_name}
    kana_first_name       {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
