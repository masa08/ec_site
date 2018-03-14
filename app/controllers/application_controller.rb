class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :ransack
  protect_from_forgery with: :exception

  helper_method :current_cart

  private
  def ransack
    # ransack
    @search = Item.ransack(params[:q])  #追加
    @results = @search.result
  end

  def configure_permitted_parameters
    #strong parametersを設定し、usernameを許可
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name_kanji, :postal_code, :phone_number, :email, :address, :user_name_kana, :password, :password_confirmation) }
  end
end
