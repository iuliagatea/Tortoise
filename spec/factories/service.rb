FactoryBot.define do
  factory :service do
    name { Faker::Name.name }
    price { Faker::Number.decimal(2) }
    duration { Faker::Number.between(1, 80) }
  end
end