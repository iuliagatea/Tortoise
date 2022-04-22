# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    from_time { DateTime.now }
    to_time { DateTime.now + 50.minutes }
  end
end
