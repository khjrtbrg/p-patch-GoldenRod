class Tool < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :name, presence: true

  validates :image_url,
            presence: true,
            format: { with: URI.regexp(["http"]) }

  # validate :url_returns_200
  #
  # # Custom methods
  # def url_returns_200
  #   uri = URI(image_url)
  #   unless Net::HTTP.get_response(uri).is_a?(Net::HTTPSuccess)
  #     errors.add(:image_url, "Cannot fetch the URL specified.")
  #   end
  # end

  # Methods
  def checked_out_by?(user) # user.has_tool?
    user_id == user.id
  end

  def unavailable?
    user_id ? true : false
  end
end
