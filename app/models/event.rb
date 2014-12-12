class Event < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, presence: true

  validates :date, presence: true
end
