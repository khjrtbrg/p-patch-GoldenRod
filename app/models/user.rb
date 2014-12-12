class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :posts
  has_many :tools
  has_many :events

  # Validations
  validates :user_name,
            presence: true,
            length: { minimum: 6 },
            uniqueness: true

  validates :email,
            presence: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
            uniqueness: true

  validates :password,
            presence: true,
            confirmation: true

  validates :password_confirmation,
            presence: true

  # Make alternative create method that also sets admin to false!
end
