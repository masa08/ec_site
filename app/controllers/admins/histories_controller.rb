class Admins::HistoriesController < ApplicationController
	  before_action :authenticate_admin!

	def index
		@histories = History.all
    	@searches = History.ransack(params[:q])
    	@result = @searches.result

	end
	def show
		@history = History.find(params[:id])
	end
	def edit
		@history = History.find(params[:id])

	end
	def update
		history = History.find(params[:id])
		history.update(history_params)
		redirect_to admins_history_path(history)
	end
	def destroy
		history = History.find(params[:id])
		history.destroy
		redirect_to admins_histories_path
	end
	private
	def history_params
		params.require(:history).permit(:send_name_kanji,
										:send_name_kana, 
										:status_id,
										:send_postal_code,
										:send_address,
										:payment_id,
										:delivery_id
										)
	end
	def search_params
		params.require(:q).permit!
	end

end
