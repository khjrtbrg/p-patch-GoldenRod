class Event < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, :date, :user_id, presence: true
end
