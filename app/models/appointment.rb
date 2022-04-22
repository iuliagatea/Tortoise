# frozen_string_literal: true

class Appointment < ActiveRecord::Base
  belongs_to :service
  belongs_to :customer

  validates_presence_of :service, :customer, :date, :from_time, :to_time

  before_save :to_time_after_from_time?

  private

  def to_time_after_from_time?
    errors.add :to_time, 'must be after from time' if to_time < from_time
  end
end
