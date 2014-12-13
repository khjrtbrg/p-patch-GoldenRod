module CalendarHelper
  def time_formatter(time)
    time ? time.strftime('%l:%M%P') : "All Day"
  end
end
