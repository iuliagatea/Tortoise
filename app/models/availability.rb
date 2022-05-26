# frozen_string_literal: true

class Availability < ActiveRecord::Base
  belongs_to :partner
  validates :wday, presence: true, unless: :date
  validates :date, presence: true, unless: :wday
end
