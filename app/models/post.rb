class Post < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, :content, :user_id, presence: true

  def pretty_updated_at
    updated_at.strftime("%m/%d/%y, %T")
  end
end
