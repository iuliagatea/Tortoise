class Partner < User
  has_many :services, foreign_key: 'user_id', inverse_of: 'user'
  has_many :appointments, foreign_key: 'partner_id'

  def customers
    appointments.map(&:customer).uniq
  end
end
