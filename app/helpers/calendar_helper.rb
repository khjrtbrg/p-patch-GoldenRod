module CalendarHelper

  def generate_offset_days
    string = ""
    Event.start_days_offset.times do
      string << "<div class='day offset-day'></div>\n"
    end
    string.html_safe
  end

  def generate_month_days(events)
    days = event_days(events)
    string = ""
    counter = 1
    Event.days_in_month.times do
      if days.include?(counter)
        string << "<div class='day'><span>#{counter}</span><p>Events Today!</p></div>"
      else
        string << "<div class='day'><span>#{counter}</span></div>"
      end
      counter += 1
    end
    string.html_safe
  end

  def event_days(events)
    events.pluck(:date).map { |date| date.day }
  end
end
