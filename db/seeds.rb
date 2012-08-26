# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create name: 'Vasily Pupkin', email: 'pupkin@mail.ru',
  password: 'pupkin', password_confirmation: 'pupkin', role: 'admin'
user = User.create name: 'Ivan Ivanov', email: 'd.ivan@mail.ru',
  password: 'ivanushka', password_confirmation: 'ivanushka', role: 'user'

user.orders.create title: 'First order', description: 'Simple first order',
  completion: false
user.orders.create title: 'Completed order', description: 'This is completed order',
  completion: true
user.orders.create title: 'Uncompleted order', description: 'This is uncompleted order',
  completion: false
admin.orders.create title: 'Admin order', description: 'Order created by admin',
  completion: false
