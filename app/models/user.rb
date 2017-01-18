class User < ApplicationRecord
  has_secure_password
  has_many :stats
  has_many :list_friend, through: :friends, source: :stat
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: true }, format: { with: EMAIL_REGEX }
end
