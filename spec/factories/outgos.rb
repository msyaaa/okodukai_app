FactoryBot.define do
  factory :outgo do
    price { 11_111 }
    description { 'abcdefg' }
    date { Faker::Date.in_date_period }
    association :user
  end
end
