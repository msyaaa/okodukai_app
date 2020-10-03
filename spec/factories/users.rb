FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name}
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end
