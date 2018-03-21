class Admins::UsersController < ApplicationController
	def index
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		user = User.find(params[:id])
		user.update(params[:id])
		redirect_to admins_users_path
	end
	private
	def user_params
		params.require(:user).permit(:email, :user_name_kanji, :user_name_kana, :address, :postal_code, :phone_number)
	end
end
