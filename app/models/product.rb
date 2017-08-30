class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: true
  validates :capacity, numericality: true

  has_and_belongs_to_many :managers, class_name: 'User::Manager'
  has_many :invoice_details
  has_many :invoice_bills, through: :invoice_details
  belongs_to :factory
end
