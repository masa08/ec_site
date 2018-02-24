Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'purchases/confimation'

  get 'purchases/complete'

  get 'purchases/purchase_info'

  get 'items/index'

  get 'items/show'

  get 'carts/show'

  get 'admins/index'

  get 'admins/user'

  get 'admins/histories_index'

  get 'users/show'

  get 'users/edit'

  get 'users/history_show'

  get 'users/goodbye_confirmation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
