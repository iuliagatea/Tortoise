# frozen_string_literal: true

class User < ActiveRecord::Base
  include Validations
  has_secure_password
  validates_presence_of :first_name, :last_name
  validates_length_of :first_name, :last_name, minimum: 3, maximum: 25
  before_save :downcase_email

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
