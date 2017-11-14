require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factory_manager' do
    describe 'Associations' do
      it { should belong_to(:factory) }
    end
  end
end
