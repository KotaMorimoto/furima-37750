FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    first_name            { '名前なまえナマエ' }
    last_name             { '名字みょうじミョウジ' }
    first_name_kana       { 'ナマエ' }
    last_name_kana        { 'ミョウジ' }
    birthday              { '1989-11-09' }
  end
end
