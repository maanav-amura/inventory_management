require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'valid users' do
    let(:user) { User.new(name:'ayush', age: 21, factory_id:  Factory.first.id , email: 'ayush@gmail.com', password: 'ayushbillore') }

    describe 'Associations' do
      it { should have_many(:invoice_bills) }
      it { should belong_to(:factory) }
    end

    describe 'Validations' do
      it { should validate_presence_of(:name) }
      it { should validate_numericality_of(:age) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
    end

    it 'is not valid without a valid name' do
      expect(user).to be_valid
    end

    it 'is not valid without a valid and numeric age' do
      expect(user).to be_valid
    end

    it 'is not valid without a valid email' do
      expect(user).to be_valid
    end
    it 'is not valid without a valid password' do
      expect(user).to be_valid
    end

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'has a valid instance of User class' do
      expect(user).instance_of?(User)
    end

    it 'can have many Invoice Bills' do
      assc = User.reflect_on_association(:invoice_bills)
      expect(assc.macro).to eq :has_many
    end

    it 'should belong to a Factory' do
      assc = User.reflect_on_association(:factory)
      expect(assc.macro).to eq :belongs_to
    end

  end

  describe 'invalid users' do
    before(:each) do
      @user = User.new
    end

    it 'is not valid without a valid name' do
      expect(@user).to_not be_valid
    end

    it 'is not valid without a valid name'   do
      expect(@user).to_not be_valid
    end

    it 'is not valid without a valid and numeric age' do
      expect(@user).to_not be_valid
    end

    it 'is not valid without a valid email' do
      expect(@user).to_not be_valid
    end
    it 'is not valid without a valid password' do
      expect(@user).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(@user).to_not be_valid
    end

    describe @user do
      it { is_expected.to_not have_attributes(name: 'ayush') }
    end

  end
end
