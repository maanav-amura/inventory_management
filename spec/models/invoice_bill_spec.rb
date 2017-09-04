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
  end

  describe 'invalid invoice_bills' do
    let(:invoice_bill) { InvoiceBill.new }

    it 'is not valid without a valid user' do
      expect(invoice_bill).to_not be_valid
    end

    it 'is not valid without a valid and numeric price' do
      expect(invoice_bill).to_not be_valid
    end
  end
end
