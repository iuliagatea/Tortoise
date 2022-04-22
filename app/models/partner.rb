# frozen_string_literal: true

class Partner < User
  has_many :services
  has_many :availabilities

  def customers
    appointments.map(&:customer).uniq
  end

  def appointments
    services.map(&:appointments).flatten
  end

  def date_appointments(date)
    appointments.select { |appointment| appointment.date.strftime('%d.%m.%Y') == date.strftime('%d.%m.%Y') }
  end
end
