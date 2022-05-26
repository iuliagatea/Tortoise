# frozen_string_literal: true

module Validations
  extend ActiveSupport::Concern

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&+=]).{6,}\z/.freeze
  VALID_TYPES = %w[Customer Partner].freeze

  included do
    validates_length_of :password, minimum: 6
    validates_format_of :password, with: VALID_PASSWORD_REGEX
    validates :email, presence: true, length: { maximum: 105 },
                      uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEX }
    validates_presence_of :first_name, :last_name
    validates_length_of :first_name, :last_name, minimum: 3, maximum: 25
    validates_inclusion_of :type, in: VALID_TYPES
    validates :company, presence: true, if: -> { type == 'Partner' }
  end
end
