FactoryBot.define do
  factory :appointment do
    from { DateTime.now }
    to { DateTime.now + 50.minutes }
  end
end