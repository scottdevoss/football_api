class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :password_confirmation

  has_secure_password
end