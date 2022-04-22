# frozen_string_literal: true

class TimeSlot
  def initialize(service, date)
    @partner = service.partner
    @duration = service.duration.to_f
    @date = date
  end

  def slots
    available_slots = []
    # byebug
    working_hours.each do |start_of_day, end_of_day|
      slot_start_time = start_of_day
      while slot_start_time != end_of_day && slot_start_time < end_of_day
        slot_end_time = slot_start_time + @duration.minutes
        if busy_slots.empty?
          available_slots << slot_start_time
          slot_start_time = slot_end_time
        else
          busy_slots.each do |busy_from_time, busy_to_time|
            if slot_end_time <= busy_from_time || slot_start_time >= busy_to_time
              available_slots << slot_start_time
              slot_start_time = slot_end_time
            else
              slot_start_time = busy_to_time
            end
          end
        end
      end
    end
    available_slots
  end

  private

  def wday
    @date.wday
  end

  def working_hours
    availabilities = @partner.availabilities.where(wday: wday)
    availabilities.map do |availability|
      [availability.from_time, availability.to_time]
    end
  end

  def busy_slots
    @partner.date_appointments(@date).map do |appointment|
      [appointment.from_time, appointment.to_time]
    end
  end
end
