class Partner < User
  has_many :services, foreign_key: 'user_id', inverse_of: 'user'
end