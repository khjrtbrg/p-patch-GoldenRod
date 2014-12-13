class Event < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, :date, :user_id, presence: true

  # Methods
  def self.start_month
    Date.today.at_beginning_of_month
  end

  def self.end_month
    Date.today.at_end_of_month
  end

  def self.events_this_month
    Event.where(date: (start_month..end_month))
  end

  def self.days_in_month
    end_month.day
  end

  # will return the index of the first day of the month
  def self.start_days_offset
    start_month.cwday
  end

  def self.event_days_array
    events_this_month.pluck(:date).map { |date| date.day }
  end

  def pretty_start_time
    pretty_time(start_time)
  end

  def pretty_end_time
    pretty_time(end_time)
  end

  def pretty_time(time)
    time ? time.strftime('%l:%M%P') : "All Day"
  end
end
