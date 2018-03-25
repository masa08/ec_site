class Admins::HistoriesController < ApplicationController
	  before_action :authenticate_admin!

	def index
		@histories = History.all
	end
	def show
		@history = History.find(params[:id])
	end
	def edit
		@history = History.find(params[:id])
	end
	def update
		
	end
	def destroy
		history = History.find(params[:id])
		history.destroy
		redirect_to admins_histories_path
	end
	private
	def history_params
		params.require(:history).permit()
	end

end
