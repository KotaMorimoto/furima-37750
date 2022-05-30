FactoryBot.define do
  factory :item do
    name {Faker::name}
    description {Faker::Lorem.sentence}
    category_id {rand(2..11)}
    condition_id {rand(2..7)}
    shipment_fee_id {rand(2..3)}
    prefecture_id {rand(1..47)}
    lead_time_id {rand(2..4)}
    price {rand(300..9999999)}

    association :user

    after(:build) do |item|
    item.image.attach(io: File.open('public/images/PINE1.jpg'), filename: 'PINE1.jpg')
    end
  end
end