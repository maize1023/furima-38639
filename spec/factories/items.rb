FactoryBot.define do
  factory :item do
    name              {'テスト商品'}
    description       {'テスト商品です'}
    category_id       {2}
    condition_id      {2}
    fee_id            {2}
    from_id           {2}
    day_id            {2}
    price             {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
