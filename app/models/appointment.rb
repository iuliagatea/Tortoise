# frozen_string_literal: true

class Appointment < ActiveRecord::Base
  attr_reader :max_allowed
  belongs_to :service
  belongs_to :customer

  validates_presence_of :service, :customer, :date, :from_time

  before_save :to_time_after_from_time?
  before_save :check_intervals

  def duration
    total_seconds = to_time - from_time
    seconds = total_seconds % 60
    minutes = (total_seconds / 60) % 60
    hours = total_seconds / (60 * 60)

    format('%02d:%02d:%02d', hours, minutes, seconds)
  end

  def start_date
    (date.strftime('%d.%m.%Y') + " " + from_time.strftime('%I:%M')).to_datetime
  end

  def end_date
    (date.strftime('%d.%m.%Y') + " " + to_time.strftime('%I:%M')).to_datetime
  end

  private

  def to_time_after_from_time?
    # errors.add :to_time, 'must be after from time' if to_time < from_time
  end

  def check_intervals
    final_time = from_time + service.duration_minutes
    errors.add :from_time, 'ttt' if Appointment.where(date: date, from_time: from_time..final_time).any?
  end
end
