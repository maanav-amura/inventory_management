# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  Console command to load ::  load "#{Rails.root}/db/seeds.rb"

factory = Factory.create(name: Faker::Company.name, city: Faker::GameOfThrones.city)
User::Manager::FactoryManager.create(name: Faker::Name.name, age: 31, factory_id: factory.id, email: Faker::Internet.unique.email, password: '12345678')
User::Manager::SalesManager.create(name: Faker::Name.name, age: 21, factory_id: factory.id, email: Faker::Internet.unique.email, password: '12345678')
User::Manager::InventoryManager.create(name: Faker::Name.name, age: 14, factory_id: factory.id, email: Faker::Internet.unique.email, password: '12345678')
user = User::Buyer::Customer.new(name: Faker::Name.name, age:21, email: Faker::Internet.unique.email, password: '12345678')
user.factory = factory
user.save
User::Buyer::Shopkeeper.create(name: Faker::Name.name, age: 27, factory_id: factory.id, email: Faker::Internet.unique.email, password: '12345678')
User::Buyer::Vendor.create(name: Faker::Name.name, age: 47, factory_id: factory.id, email: Faker::Internet.unique.email, password: '12345678')
Product.create(name:Faker::Food.dish,price:125,capacity:100,available: true,factory_id: factory.id)
Product.create(name:Faker::Food.dish,price:50,capacity:100,available: true,factory_id: factory.id)
customer = User.find_by_type('User::Buyer::Customer')
bill = InvoiceBill.new(total_price:175)
bill.user = customer
bill.save
bill.invoice_details << InvoiceDetail.new(product_id: Product.first.id, quantity:1)
bill.invoice_details << InvoiceDetail.new(product_id: Product.second.id, quantity:1)
bill.products
bill.invoice_details
u = User.find_by_type('User::Manager::InventoryManager')
p = Product.first
u.products << p
p  = Product.first
p.managers
u.products
