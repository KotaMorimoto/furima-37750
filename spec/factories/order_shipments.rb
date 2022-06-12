FactoryBot.define do
  factory :order_shipment do
    zip_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    branch { '1-1' }
    building { '東京ハイツ' }
    phone { '00012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
