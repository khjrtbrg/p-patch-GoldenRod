module CalendarHelper

  def generate_offset_days
    string = ""
    Event.start_days_offset.times do
      string << "<div class='day offset-day'></div>\n"
    end
    string.html_safe
  end

  def generate_month_days(events)
    string = ""
    counter = 1
    Event.days_in_month.times do
      string << "<div class='day'>#{counter}</div>\n"
      counter += 1
    end
    string.html_safe
  end
end
