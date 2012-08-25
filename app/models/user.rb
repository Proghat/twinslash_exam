class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :role
  has_secure_password

  has_many :orders

  validates :name, presence: true, length: { maximum: 50 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
