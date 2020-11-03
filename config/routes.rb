Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  devise_for :users
end
