class User < ActiveRecord::Base
  attr_accessible :email, :name, :role

  has_many :orders
end
