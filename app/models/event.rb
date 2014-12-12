class Event < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, presence: true
end
