require 'rails_helper'

RSpec.describe Factory, type: :model do
  describe 'Valid Factory' do
    before(:each) do
      @factory = Factory.new(name: 'Dota')
    end

    describe 'Associations' do
      it { should have_many(:products) }
      it { should have_many(:users) }
      it { should have_one(:factory_manager) }
    end

    describe 'Validations' do
      it { should validate_presence_of(:name) }
    end

    describe Factory.new(name: 'Dota') do
      it { is_expected.to have_attributes(name: 'Dota') }
    end

    it 'is not valid if it is not an instance of Factory' do
      expect(@factory.instance_of?(Factory)).to be
    end

    it 'is not valid if its name not a String' do
      expect(@factory.name.class).to match(String)
    end
  end

  describe 'Invalid Factory' do
    let(:factory) { Factory.new }

    it 'is not valid without a valid name' do
      expect(factory).to_not be_valid
    end

    it 'is not valid if it is not an instance of Factory' do
      factory = User.new
      expect(factory.instance_of?(Factory)).to_not be
    end

    it 'is not valid if its name not a String' do
      factory.name = 123
      expect(factory.name.class).to be(String)
    end

  end
end
