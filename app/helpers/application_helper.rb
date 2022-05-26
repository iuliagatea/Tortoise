# frozen_string_literal: true

module ApplicationHelper
  def format_date(date)
    date.strftime('%d.%m.%Y')
  end

  def format_time(date)
    date.strftime('%H:%M')
  end
end
