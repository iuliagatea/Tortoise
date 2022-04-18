FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(6, 20, true, true) }
    phone_number { Faker::PhoneNumber.cell_phone }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    company { Faker::Name.name }
    description { Faker::Lorem.sentence }
  end

  factory :partner do
    email { Faker::Internet.email }
    password { Faker::Internet.password(6, 20, true, true) }
    phone_number { Faker::PhoneNumber.cell_phone }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    company { Faker::Name.name }
    description { Faker::Lorem.sentence }
  end

  factory :customer do
    email { Faker::Internet.email }
    password { Faker::Internet.password(6, 20, true, true) }
    phone_number { Faker::PhoneNumber.cell_phone }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    company { Faker::Name.name }
    description { Faker::Lorem.sentence }
  end
end
