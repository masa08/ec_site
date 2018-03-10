class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    session[:cart_id] = User.cart_id
    # if session[:cart_id]
    #   @cart = Cart.find(session[:cart_id])
    # else
    #   @cart = Cart.create
    #   session[:cart_id] = @cart.
    # end
  end

  protected

  def configure_permitted_parameters
    #strong parametersを設定し、usernameを許可
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name_kanji, :postal_code, :phone_number, :email, :address, :user_name_kana, :password, :password_confirmation) }
  end
end
