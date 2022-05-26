# frozen_string_literal: true
# to do: refactor!
class TimeSlot
  def initialize(service, date)
    @partner = service.partner
    @duration = service.duration_minutes
    @date = date
  end

  def slots
    available_slots = []
    working_hours.each do |start_of_day, end_of_day|
      slot_start_time = start_of_day
      while slot_start_time != end_of_day && slot_start_time < end_of_day
        slot_end_time = slot_start_time + @duration
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

  def interval_slots
    return working_hours if busy_slots.empty?

    available_intervals = []
    working_hours.each do |start_of_day, end_of_day|
      slot_end_time = start_of_day + @duration
      busy_slots.each do |busy_from_time, busy_to_time|
        if busy_from_time >= slot_end_time && busy_from_time < end_of_day
          available_intervals << [start_of_day, busy_from_time]
          start_of_day = busy_to_time
        end
      end
      if slot_end_time <= end_of_day
        available_intervals << [start_of_day, end_of_day]
      end
    end

    available_intervals
  end

  # private

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
