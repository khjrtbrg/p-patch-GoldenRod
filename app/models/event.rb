class Event < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, :date, :user_id, presence: true

  # Methods
  def self.events_this_month
    Event.where(date: (Calendar.start_month..Calendar.end_month))
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
