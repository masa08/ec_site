Rails.application.routes.draw do

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
root "items#index"

resources :users, only: [:edit, :update, :show] do
  resource :histories, only: [:show]
end

resources :admins, only: [:index] do
  resource :histories, only: [:show, :edit, :update]
  resource :users, only: [:index, :show, :edit, :update]

end

resources :items

namespace :admins do
  resources :items
end

# cart関連
resources :carts, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'


post 'purchases/comfirmation' => 'purchases#comfirmation'
get 'purchases/complete' => 'purchases#complete'
get 'purchases/thankyou' => 'purchases#thankyou'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
