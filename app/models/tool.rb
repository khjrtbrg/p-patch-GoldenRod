class Tool < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :name, :user_id, presence: true

  validates :image_url,
            presence: true,
            format: { with: URI.regexp(["http"]) }
end
