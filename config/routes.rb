Rails.application.routes.draw do



  devise_for :admins
  devise_for :users
root "items#index"

resources :users, only: [:edit, :update, :show] do
  resource :histories, only: [:show]
end

resources :admins, only: [:index] do
  resource :histories, only: [:show, :edit, :update]
  resource :users, only: [:index, :show, :edit, :update]
  resource :items
end

resources :items

post 'purchases/comfirmation' => 'purchases#comfirmation'
get 'purchases/complete' => 'purchases#complete'
get 'purchases/thankyou' => 'purchases#thankyou'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
