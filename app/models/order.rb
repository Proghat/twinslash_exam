class Order < ActiveRecord::Base
  before_validation :default_values

  attr_accessible :title, :description
  attr_accessible :completion # yes, it's accessible, but cancan care about permissions

  validate :title, presence: true, length: { maximum: 160 }
  validate :description, presence: true, length: { maximum: 1000 }

  belongs_to :user

  default_scope order('id DESC')
  scope :completed, where(completion: true)
  scope :uncompleted, where(completion: false)

  def default_values
    self.completion = false if self.completion.nil?
    true
  end
end
