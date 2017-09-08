class ProductDetail
  include Mongoid::Document

  field :product_id, type: BSON::ObjectId
  field :name, type: String
  field :quantity, type: Integer

  validates :product_id, presence: true
  validates :name, presence: true
  validates :quantity, numericality: true

  embedded_in :invoice_bill
end
