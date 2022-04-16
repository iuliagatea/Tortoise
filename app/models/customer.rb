class Customer < User
  has_and_belongs_to_many :partners, join_table: 'partners_customers'
end
