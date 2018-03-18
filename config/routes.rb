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

post '/genres' => 'application#genre'
post '/types' => 'application#type'

resources :users, only: [:edit, :update, :show] do
  resource :histories, only: [:show]
end
post '/admins/items' => 'admins/items#create'

resources :items

namespace :admins do
  resources :items
  resources :histories, only: [:show, :edit, :update, :index]
  resources :users, only: [:index, :show, :edit, :update]
end

# cart関連
resources :carts, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  post '/delete_item' => 'carts#delete_item'
  get '/more_items' => 'carts#more_items', as: "more_items"
# purchase関連
get 'purchases/comfirmation' => 'purchases#comfirmation'
get 'purchases/complete' => 'purchases#complete_view', as: "complete_view"
post 'purchases/complete' => 'purchases#complete'
get 'purchases/thankyou' => 'purchases#thankyou'



# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
