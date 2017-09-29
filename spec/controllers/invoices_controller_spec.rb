require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create :user
    sign_in @user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'does not renders a different template' do
      get :index
      expect(response).to_not render_template(:new)
    end
    it 'has a valid Http Status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: InvoiceBill.first.id } }
    it 'renders the new template' do
      expect(subject).to render_template(:show)
    end
    it 'does not renders a different template' do
      expect(subject).to_not render_template(:index)
    end
    it 'has a valid Http Status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
