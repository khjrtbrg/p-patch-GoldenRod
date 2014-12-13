class Calendar
  attr_accessor :date_number, :events, :offset

  # why can't we get this class to load in rails console?
  def initialize(date_number, events, offset)
    @date_number = date_number
    @events = events
    @offset = offset
  end

  def self.start_month
    Date.today.at_beginning_of_month
  end

  def self.end_month
    Date.today.at_end_of_month
  end

  def self.days_in_month
    end_month.day
  end

  # will return the index of the first day of the month
  def self.start_days_offset
    start_month.cwday
  end

  def self.generate_offset_days
    array = []
    start_days_offset.times do
      array << Calendar.new(nil, nil, true)
    end
    array
  end

  def self.find_events(counter, events)
    iteration_date = Date.parse("#{counter}/#{start_month.month}/#{start_month.year}")
    events.where(date: iteration_date)
  end

  def self.generate_month_days
    days = Event.event_days_array
    events = Event.events_this_month
    array = []
    counter = 1
    days_in_month.times do
      if days.include?(counter)
        day_events = find_events(counter, events)
        array << Calendar.new(counter, day_events, false)
      else
        array << Calendar.new(counter, nil, false)
      end
      counter += 1
    end
    array
  end

  def self.generate_month
    array = generate_offset_days
    array.concat(generate_month_days)
  end
end
