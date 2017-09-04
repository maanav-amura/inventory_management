require 'rails_helper'

# FactoryManager model testing
RSpec.describe User, type: :model do
  describe 'factory_manager' do
    let(:factory_manager) { User.new(name: 'ayush', age: 21, factory_id: Factory.first.id,
      email: 'ayush@gmail.com', password: 'ayushbillore', type: 'FactoryManager') }

    describe 'Associations' do
      it { should belong_to(:factory) }
    end
  end
end
