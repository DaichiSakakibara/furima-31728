Rails.application.routes.draw do
 devise_for :users
root to: "items#index"
 resources :items, only: [:index, :new, :create] do

   collection do
    get 'calculation'
   end
  end 

end
