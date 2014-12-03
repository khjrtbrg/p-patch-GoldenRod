class User < ActiveRecord::Base
  has_many :posts
  has_many :tools

  validates :user_name, presence: true
  validates :user_name, length: { minimum: 6 }
end
