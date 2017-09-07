require 'rails_helper'

RSpec.describe User::Buyer, type: :model do
  describe 'factory_manager' do
    describe 'Types' do
      it 'should be of type in Buyer' do
        type = ''
        expect(User::Buyer.types.include?(type)).to_not be
      end
    end
  end
end
