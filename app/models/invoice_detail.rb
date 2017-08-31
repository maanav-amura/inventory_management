class InvoiceDetail < ApplicationRecord
  validates :quantity, numericality: true
  validates :product_id, :invoice_bill_id, presence: true

  belongs_to :product
  belongs_to :invoice_bill
end
