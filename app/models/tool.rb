class Tool < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :name, :user_id, presence: true

  validates :image_url,
            presence: true,
            format: { with: URI.regexp(["http"]) }

  # validate :url_returns_200

#   def url_returns_200
#     uri = URI(image_url)
# p uri
#     a = Net::HTTP.get_response(uri).is_a?(Net::HTTPSuccess)
# puts a
#   end

end
