Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :products do
    get 'purchase', on: :collection
    get 'confirm', on: :member
    get 'search', on: :collection
    post '', action: 'purchase_confirm', on: :member
  end
  resources :invoices, only: %i[index show]
end
