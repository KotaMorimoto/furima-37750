FactoryBot.define do
  factory :order_shipment do
    zip_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    branch { '1-1' }
    building { '東京ハイツ' }
    phone {'00012345678'}
    item_id {99}
    user_id {1}
  end
end
