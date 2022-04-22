# frozen_string_literal: true

class Service < ActiveRecord::Base
  belongs_to :partner
  has_many :appointments
end
