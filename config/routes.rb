Rails.application.routes.draw do
  resources :plans
  resources :items
  resources :plans do
    resources :items
  end

  root to: 'plans#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
