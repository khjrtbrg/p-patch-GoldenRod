class Tool < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :name, :image_url, :user_id, presence: true
end
