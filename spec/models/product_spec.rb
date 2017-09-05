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

    describe Product.new(name: 'desolator', price: 350, capacity: 100, available: true, factory_id: Factory.first.id) do
      it { is_expected.to have_attributes(name: 'desolator') }
      it { is_expected.to have_attributes(price: 350) }
      it { is_expected.to have_attributes(capacity: 100) }
      it { is_expected.to have_attributes(available: true) }
    end

    it 'is not valid if it is not an instance of Factory' do
      expect(product.instance_of?(Product)).to be
    end

    it 'is not valid if its name not a String' do
      expect(product.name.class).to match(String)
    end
  end

  describe 'invalid products' do
    let(:product) { Product.new(price: '350') }

    describe Product.new do
      it { is_expected.to_not have_attributes(name: 'desolator') }
      it { is_expected.to_not have_attributes(price: 350) }
      it { is_expected.to_not have_attributes(capacity: 100) }
      it { is_expected.to_not have_attributes(available: true) }
    end

    it 'is not valid if it is not an instance of Factory' do
      expect(product.instance_of?(User)).to_not be
    end

    it 'is not valid if its name not a String' do
      expect(product.name.class).to_not be(Integer)
    end
  end
end
