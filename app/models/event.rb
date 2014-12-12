class Event < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, :date, :user_id, presence: true

  # Methods
  def self.events_this_month
    Event.where(date: (start_month..end_month))
  end

  def self.start_month
    Date.today.at_beginning_of_month
  end

  def self.end_month
    Date.today.at_end_of_month
  end

  def self.number_of_days
    end_month.day
  end
end
