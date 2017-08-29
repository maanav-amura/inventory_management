class Factory < ApplicationRecord
  validates :name, presence: true

  has_many :users
  has_many :products
  has_one :factory_manager, class_name: 'User::Manager::FactoryManager'
end
