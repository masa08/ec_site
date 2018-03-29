class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ransack
  before_action :genre
  before_action :type

  protect_from_forgery with: :exception

  helper_method :current_cart

  private
  def genre
    @genres = Genre.all
    @genre_name = params[:genre_name]
    # @genre_search = Item.ransack(params[:q])
    # @genre_results = @genre_search.result
  end

  def type
    @types = Type.all
    # @type_search = Item.ransack(params[:q])
    # @type_results = @type_search.result
  end

  def ransack
    @search = Item.ransack(params[:q])
    @results = @search.result
  end

  def configure_permitted_parameters
    #strong parametersを設定し、usernameを許可
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name_kanji, :postal_code, :phone_number, :email, :address, :user_name_kana, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:user_name_kanji, :postal_code, :phone_number, :email, :address, :user_name_kana) }

  end
end
