class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :price, type: Integer
  field :capacity, type: Integer
  field :available, type: Boolean, default: false

  belongs_to :factory

  validates :name, presence: true, uniqueness: true
  validates :price, :capacity, numericality: true

  scope :all_products, -> { order('name ASC') }
  scope :available_products, -> { where(available: true).order('name ASC') }
end
