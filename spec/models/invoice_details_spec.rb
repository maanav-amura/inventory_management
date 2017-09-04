require 'rails_helper'

RSpec.describe InvoiceDetail, type: :model do
  describe 'valid invoice_details' do
    let(:invoice_detail) { InvoiceBill.new(quantity: 300, product_id: Product.first.id, invoice_bill_id: InvoiceBill.first.id) }

    describe 'Associations' do
      it { should belong_to(:product) }
      it { should belong_to(:invoice_bill) }
    end

    describe 'Validations' do
      it { should validate_numericality_of(:quantity) }
      it { should validate_presence_of(:product_id) }
      it { should validate_presence_of(:invoice_bill_id) }
    end
  end

  describe 'invalid invoice_details' do
    let(:invoice_detail) { InvoiceBill.new }

    it 'is not valid without a valid user' do
      expect(invoice_detail).to_not be_valid
    end

    it 'is not valid without a valid invoice_bill' do
      expect(invoice_detail).to_not be_valid
    end

    it 'is not valid without a valid and numeric quantity' do
      expect(invoice_detail).to_not be_valid
    end
  end
end
