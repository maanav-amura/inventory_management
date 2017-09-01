class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, :capacity, numericality: true

  has_many :invoice_details
  has_many :invoice_bills, through: :invoice_details
  belongs_to :factory

  scope :all_products, -> { order('name ASC') }
  scope :available_products, -> { where(available: true).order('name ASC') }
end
