class Customer < User
  has_many :appointments, foreign_key: 'customer_id'

  def partners
    appointments.map(&:partner).uniq
  end
end
