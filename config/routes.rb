Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'welcome#index'
  get 'welcome/index'
  get 'welcome/historical_rates'
  get 'welcome/latest_rates'
  post 'welcome/calculate'
  get 'welcome/user_index'
end
