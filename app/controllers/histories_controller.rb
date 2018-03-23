class HistoriesController < ApplicationController

  def show
  end

  def new
  	@user = current_user
  	@history = History.new

  end

  def comfirmation
  	@user = current_user
  	@history = History.new(history_params)
  	@cart = Cart.find_by(user_id: current_user)
  end

  def create
  	
  	@history = History.new(history_params)
		if @history.save
			redirect_to complete_view_path
		else
			binding.pry
			@user = current_user
			render :action => "new", id: @user.id 
		end
  	
  end

	private
	def history_params
		params.require(:history).permit(:user_id, :payment_id, :delivery_id, :send_address, :send_postal_code, :send_name_kanji, :send_name_kana)
	end

end
