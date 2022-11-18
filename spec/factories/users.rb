FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number:2)}
    birth_date            {Faker::Date.backward }
    kanji_last_name       {'田所'}
    kana_first_name2      {'武蔵'}
    kana_last_name        {'タドコロ'}
    kana_first_name       {'タケゾウ'}
    # email                 {Faker::Internet.free_email}
    email                 {"tester@example.com" }
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
