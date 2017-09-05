require 'rails_helper'

RSpec.describe InvoiceDetail, type: :model do
  describe 'valid invoice_details' do
    let(:invoice_detail) { InvoiceDetail.new(quantity: 300, product_id: Product.first.id, invoice_bill_id: InvoiceBill.first.id) }

    describe 'Associations' do
      it { should belong_to(:product) }
      it { should belong_to(:invoice_bill) }
    end

    describe 'Validations' do
      it { should validate_numericality_of(:quantity) }
      it { should validate_presence_of(:product_id) }
      it { should validate_presence_of(:invoice_bill_id) }
    end

    describe InvoiceDetail.new(quantity: 300, product_id: Product.first.id, invoice_bill_id: InvoiceBill.first.id) do
      it { is_expected.to have_attributes(quantity: 300) }
      it { is_expected.to have_attributes(product_id: Product.first.id) }
      it { is_expected.to have_attributes(invoice_bill_id: InvoiceBill.first.id) }
    end

    it 'is not valid if it is not an instance of InvoiceDetail' do
      expect(invoice_detail.instance_of?(InvoiceDetail)).to be
    end

    it 'is not valid if its quantity is non-numeric' do
      expect(invoice_detail.quantity.class).to match(Integer)
    end
  end

  describe 'invalid invoice_details' do
    let(:invoice_detail) { InvoiceDetail.new }

    describe InvoiceDetail.new do
      it { is_expected.to_not have_attributes(quantity: 300) }
      it { is_expected.to_not have_attributes(product_id: Product.first.id) }
      it { is_expected.to_not have_attributes(invoice_bill_id: InvoiceBill.first.id) }
    end

    it 'is not valid if it is not an instance of InvoiceDetail' do
      expect(invoice_detail.instance_of?(InvoiceBill)).to_not be
    end

    it 'is not valid if its quantity is non-numeric' do
      invoice_detail.quantity = ''
      expect(invoice_detail.quantity.class).to_not match(Integer)
    end

  end
end
