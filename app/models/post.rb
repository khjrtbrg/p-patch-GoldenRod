class Post < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, :content, :user_id, presence: true

end
