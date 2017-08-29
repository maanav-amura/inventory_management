class InvoiceDetail < ApplicationRecord
  validates :quantity, numericality: true

  belongs_to :product
  belongs_to :invoice_bill
end
