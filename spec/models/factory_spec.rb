require 'rails_helper'

RSpec.describe Factory, type: :model do
  describe 'valid factories' do
    let(:factory) { Factory.new(name: 'dota') }

    describe 'Associations' do
      it { should have_many(:products) }
      it { should have_many(:users) }
      it { should have_one(:factory_manager) }
    end

    describe 'Validations' do
      it { should validate_presence_of(:name) }
    end
  end

  describe 'invalid factories' do
    before(:each) do
      @factory = Factory.new
    end

    it 'is not valid without a valid name' do
      expect(@factory).to_not be_valid
    end
  end
end
