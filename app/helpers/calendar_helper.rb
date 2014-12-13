module CalendarHelper

  # def generate_offset_days
  #   string = ""
  #   Event.start_days_offset.times do
  #     string << "<div class='day offset-day'></div>\n"
  #   end
  #   string.html_safe
  # end

  # def event_days(events)
  #   events.pluck(:date).map { |date| date.day }
  # end

  # # start here
  # def generate_month_days(events)
  #   days = event_days(events)
  #   string = ""
  #   counter = 1
  #   Event.days_in_month.times do
  #     if days.include?(counter)
  #       string << "<div class='day'><span>#{counter}</span><p><a href='#' data-toggle='modal' data-target='.event-#{counter}'>Events Today!</a></p></div>"
  #     else
  #       string << "<div class='day'><span>#{counter}</span></div>"
  #     end
  #     counter += 1
  #   end
  #   string.html_safe
  # end

  # def generate_event_details(events)
  #   string = ""
  #   events.each do |event|
  #     string << "<div class='modal fade event-#{event.date.day}' tabindex='-1' role='dialog' aria-labelledby='eventDetails' aria-hidden='true'>
  #                 <div class='modal-dialog modal-sm'>
  #                   <div class='modal-content'>
  #                     <h3>#{event.title}</h3>
  #                     <p><strong>Starts At:</strong> #{time_formatter(event.start_time)}</p>
  #                     <p><strong>Ends At:</strong> #{time_formatter(event.end_time)}</p>
  #                     <p><strong>Location:</strong> #{event.location}</p>
  #                     <p><strong>Description:</strong> #{event.description}</p>
  #                   </div>
  #                 </div>
  #               </div>"
  #   end
  #   string.html_safe
  # end

  def time_formatter(time)
    if time
      time.strftime('%l:%M%P')
    else
      "n/a"
    end
  end
end
