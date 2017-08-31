Rails.application.routes.draw do

  devise_for :users
  resources :products do
      get 'purchase', on: :collection
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
