class FactorySeed
  def self.seed
    factory = create_factory
    create_managers(factory.id)
    create_buyers(factory.id)
    products = create_products(factory.id)
  end
end

def create_factory
  Factory.create(name: Faker::Company.name, city: Faker::GameOfThrones.city)
end

def create_managers factory_id
  User::Manager::FactoryManager.create(name: 'maanav',age: 31,factory_id: factory_id,email: 'maanav@gmail.com',password: 'maanavshah')
  User::Manager::SalesManager.create(name: 'piyush',age: 21,factory_id: factory_id,email: 'piyush@gmail.com',password: 'piyushwani')
  User::Manager::InventoryManager.create(name: 'ankush',age: 14,factory_id: factory_id,email: 'ankush@gmail.com',password: 'ankushkhurrana')
end

def create_buyers factory_id
  User::Buyer::Customer.create(name:'aadesh',age: 21,factory_id:  factory_id,email: 'aadesh@gmail.com',password: 'aadeshshah')
  User::Buyer::Shopkeeper.create(name: 'karan',age: 27,factory_id: factory_id,email: 'karan@gmail.com',password: 'karantongay')
  User::Buyer::Vendor.create(name: 'vikas',age: 47,factory_id: factory_id,email: 'vikas@gmail.com',password: 'vikasprasad')
end

def create_products factory_id
  Product.create(name:'tango',price:125,capacity:100,available: true,factory_id: factory_id)
  Product.create(name:'clarity',price:50,capacity:100,available: true,factory_id: factory_id)
  Product.all
end
