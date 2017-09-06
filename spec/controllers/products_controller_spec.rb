require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
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

  describe 'GET #new' do
    let(:product) { Product.new }
    it 'has a new product created' do
      expect(product).to be_a_new(Product)
    end
    it 'is an instance of Product' do
      expect(product.instance_of?(Product)).to be
    end
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'does not renders a different template' do
      get :new
      expect(response).to_not render_template(:index)
    end
    it 'has a valid Http Status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    subject { post :create, params: { product: { name: 'Foo', capacity: 100, price: 100, factory_id: 1 } } }
    it 'redirects to create product_url(@product)' do
      expect(subject).to redirect_to products_path
    end
  end

  describe 'invalid #create' do
    subject { post :create, params: { product: { name: 'Foo', capacity: 100 } } }
    it 'redirects to create product_url(@product)' do
      expect(subject).to_not render_template(:edit)
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: Product.first.id } }
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

  describe 'GET #edit' do
    subject { get :edit, params: { id: Product.first.id } }
    let(:product) { Product.first }
    it 'has a product already created' do
      expect(product).to_not be_a_new(Product)
    end
    it 'is an instance of Product' do
      expect(product.instance_of?(Product)).to be
    end
    it 'renders the new template' do
      expect(subject).to render_template(:edit)
    end
    it 'does not renders a different template' do
      expect(subject).to_not render_template(:index)
    end
    it 'has a valid Http Status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#update' do
    subject { post :update, params: { product: { name: "skadi", price: 1, capacity: 21, available: false, factory_id: 1 }, commit: "Update Product", id: 4 } }
    it 'redirects to product_url(@product)' do
      expect(subject).to redirect_to products_path
    end
  end

  describe 'invalid #update' do
    subject { post :update, params: { product: { name: "skadi", price: 1, capacity: "abcd", available: false, factory_id: 1 }, commit: "Update Product", id: 4 } }
        it 'redirects to product_url(@product)' do
      expect(subject).to render_template :edit
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: 4 } }
    it 'should destroy and redirect to index' do
      expect(subject).to redirect_to action: :index
    end
  end

  describe 'GET #purchase' do
    let(:product) { get :purchase }
    it 'renders the purchase template' do
      get :purchase
      expect(response).to render_template(:purchase)
    end
    it 'does not renders a different template' do
      get :purchase
      expect(response).to_not render_template(:new)
    end
    it 'has a valid Http Status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#confirm' do
    subject { get :confirm, params: { invoice_detail: { quantity: 1 } , commit: "Confirm Purchase", id: 2 } }
    it 'redirects to product_purchase_url(@product)' do
      expect(subject).to render_template "products/confirm"
    end
  end

  describe '#purchase_confirm' do
    subject { post :purchase_confirm, params: { invoice_detail: { quantity: 1 } , commit: "Confirm Purchase", id: 2 } }
    it 'redirects to products_url' do
      expect(subject).to redirect_to '/products/purchase'
    end
  end
end
