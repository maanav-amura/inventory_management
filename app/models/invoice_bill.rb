class InvoiceBill
  include Mongoid::Document
  include Mongoid::Timestamps

  field :total_price, type: Integer

  embeds_many :product_details
  belongs_to :user

  validates :total_price, numericality: true
end
