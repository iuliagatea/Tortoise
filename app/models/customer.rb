# frozen_string_literal: true

class Customer < User
  has_many :appointments, foreign_key: 'customer_id'

  def partners
    appointments.map(&:service).uniq.map(&:partner)
  end
end
