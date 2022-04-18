class Partner < User
  has_many :services, foreign_key: 'user_id', inverse_of: 'user'
  has_and_belongs_to_many :customers, join_table: 'partners_customers'
  has_many :appointments, foreign_key: 'partner_id'

  def customers
    appointments.map(&:customer).uniq
  end
end
