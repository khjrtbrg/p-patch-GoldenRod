class Event < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, :date, :user_id, presence: true

  # Methods
  def current_month
    @month = Date.today.month
  end

  def current_year
    @year = Date.today.year
  end
end
