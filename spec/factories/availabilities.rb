# frozen_string_literal: true

FactoryBot.define do
  factory :availability do
    wday { rand(1..6) }
    from_time { '09:00' }
    to_time { '17:00' }
  end
end
