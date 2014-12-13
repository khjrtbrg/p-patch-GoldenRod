class CalendarDate
  attr_accessor :date_number, :events, :offset

  def initialize(date_number, events, offset)
    @date_number = date_number
    @events = events
    @offset = offset
  end

  def self.generate_month
    array = generate_offset_days
    array.concat(generate_month_days)
  end

  def self.generate_offset_days
    array = []
    Event.start_days_offset.times do
      array << CalendarDate.new(nil, nil, true)
    end
    array
  end

  def self.find_events(counter, events)
    iteration_date = Date.parse("#{counter}/#{Event.start_month.month}/#{Event.start_month.year}")
    events.where(date: iteration_date)
  end

  def self.generate_month_days
    days = Event.event_days_array
    events = Event.events_this_month
    array = []
    counter = 1
    Event.days_in_month.times do
      if days.include?(counter)
        day_events = find_events(counter, events)
        array << CalendarDate.new(counter, day_events, false)
      else
        array << CalendarDate.new(counter, nil, false)
      end
      counter += 1
    end
    array
  end

end
