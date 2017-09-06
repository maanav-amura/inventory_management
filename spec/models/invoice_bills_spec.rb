require 'rails_helper'

RSpec.describe InvoiceBill, type: :model do
  describe 'valid invoice_bills' do
    let(:invoice_bill) { InvoiceBill.new(user_id: User.first.id, total_price: 300) }

    describe 'Associations' do
      it { should have_many(:products) }
      it { should belong_to(:user) }
    end

    describe 'Validations' do
      it { should validate_numericality_of(:total_price) }
      it { should validate_presence_of(:user_id) }
    end

    describe InvoiceBill.new(user_id: User.first.id, total_price: 300) do
      it { is_expected.to have_attributes(user_id: User.first.id) }
      it { is_expected.to have_attributes(total_price: 300) }
    end

    it 'is not valid if it is not an instance of InvoiceBill' do
      expect(invoice_bill.instance_of?(InvoiceBill)).to be
    end

    it 'is not valid if its price is not numeric' do
      expect(invoice_bill.total_price.class).to match(Integer)
    end
  end

  describe 'invalid invoice_bills' do
    let(:invoice_bill) { InvoiceBill.new }

    describe InvoiceBill.new do
      it { is_expected.to_not have_attributes(user_id: User.first.id) }
      it { is_expected.to_not have_attributes(total_price: 300) }
    end

    it 'is not valid if its price is non-numeric' do
      expect(invoice_bill.total_price.class).to_not match(String)
    end

    it 'is not valid without a valid user' do
      expect(invoice_bill).to_not be_valid
    end

    it 'is not valid without a valid and numeric price' do
      expect(invoice_bill).to_not be_valid
    end
  end
end
