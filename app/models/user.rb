class User < ApplicationRecord
  has_secure_password :password
  validates :email_address, presence: true, uniqueness: true

  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
