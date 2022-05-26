# frozen_string_literal: true

class User < ActiveRecord::Base
  include Validations
  has_secure_password

  before_save :downcase_email

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_partner
    type == 'Partner'
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
