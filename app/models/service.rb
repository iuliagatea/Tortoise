# frozen_string_literal: true

class Service < ActiveRecord::Base
  belongs_to :partner
  has_many :appointments

  def duration_minutes
    duration.to_f.minutes
  end
end
