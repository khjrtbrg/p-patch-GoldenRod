module CalendarHelper
  def time_formatter(time)
    time ? time.strftime('%l:%M%P') : "n/a"
  end
end
