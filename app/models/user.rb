class User < ActiveRecord::Base
  before_validation :default_values

  attr_accessible :name
  attr_accessible :email
  attr_accessible :password, :password_confirmation
  has_secure_password
  attr_accessible :role # it's accessible, but cancan care about permissions

  validates :name, presence: true, length: { maximum: 50 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :role, presence: true, format: {with: /(user|admin)/}

  has_many :orders

  def default_values
    self.role ||= 'user'
  end

  def self.accessible_roles
    %w(user admin)
  end
end
