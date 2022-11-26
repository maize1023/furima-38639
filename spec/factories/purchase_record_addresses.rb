FactoryBot.define do
  factory :purchase_record_addresse do
     post_code {'123-4567'}
     from_id {3}
     town {'函館'}
     street {'1-234'}
     building {'ビル'}
     phone {Faker::Number.leading_zero_number(digits: 11)}
     token {'1'}
  end
end
