class Partner < User
  has_many :services, foreign_key: 'user_id', inverse_of: 'user'
  has_and_belongs_to_many :customers, join_table: 'partners_customers'
end
