require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'valid products' do
    let(:product) { Product.new(name: 'desolator', price: 350, capacity: 100, available: true, factory_id: Factory.first.id) }

    describe 'Associations' do
      it { should have_many(:invoice_bills) }
      it { should belong_to(:factory) }
    end

    describe 'Validations' do
      it { should validate_presence_of(:name) }
      it { should validate_numericality_of(:price) }
      it { should validate_numericality_of(:capacity) }
    end
  end

  describe 'invalid products' do
    let(:product) { Product.new(price: '350') }

    it 'is not valid without a valid name' do
      expect(product).to_not be_valid
    end

    it 'is not valid without a valid and numeric price' do
      expect(product).to_not be_valid
    end

    it 'is not valid without a valid and numeric capacity' do
      expect(product).to_not be_valid
    end
  end
end
