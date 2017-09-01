class InvoiceBill < ApplicationRecord
  validates :total_price, numericality: true
  validates :user_id, presence: true

  has_many :invoice_details
  has_many :products, through: :invoice_details
  belongs_to :user

  scope :sort_by_price, -> { order('total_price DESC') }
end
