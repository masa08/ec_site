Rails.application.routes.draw do
  get 'histories/index'

  get 'histories/show'

  get 'histories/edit'

devise_for :admins
devise_for :users

resources :users, only: [:edit, :update, :show] do
  resource :histories, only: [:show]
end

resources :admins, only: [:index] do
  resource :histories, only: [:index, :show, :edit, :update]
  resource :users, only: [:index, :show, :edit, :update]
  resource :items
end

resources :items


post 'purchases/comfirmation' => 'purchases#comfirmation'
get 'purchases/complete' => 'purchases#complete'
get 'purchases/thankyou' => 'purchases#thankyou'


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
