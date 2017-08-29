# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  Console command to load ::  load "#{Rails.root}/db/seeds.rb"

factory = Factory.create(name: 'aaa', city: 'pune')
User::Manager::FactoryManager.create(name: 'maanav', age: 31, factory_id: factory.id, email: 'maanav@gmail.com', password: 'maanavshah')
User::Manager::SalesManager.create(name: 'piyush', age: 21, factory_id: factory.id, email: 'piyush@gmail.com', password: 'piyushwani')
User::Manager::InventoryManager.create(name: 'ankush', age: 14, factory_id: factory.id, email: 'ankush@gmail.com', password: 'ankushkhurrana')
user = User::Buyer::Customer.new(name:'aadesh',age:21, email: 'aadesh@gmail.com', password: 'aadeshshah')
user.factory = factory
user.save
User::Buyer::Shopkeeper.create(name: 'karan', age: 27, factory_id: factory.id, email: 'karan@gmail.com', password: 'karantongay')
User::Buyer::Vendor.create(name: 'vikas', age: 47, factory_id: factory.id, email: 'vikas@gmail.com', password: 'vikasprasad')
Product.create(name:'tango',price:125,capacity:100,available: true,factory_id: factory.id)
Product.create(name:'clarity',price:50,capacity:100,available: true,factory_id: factory.id)
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
