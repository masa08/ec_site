class GoodbyesController < ApplicationController
	before_action :authenticate_user!

def new
	@goodbye = Goodbye.new
end

def create
	goodbye = Goodbye.new(goodbye_params)
	goodbye.user_id = current_user.id
	goodbye.save
	redirect_to  comfirmation_goodbyes_path
end

def comfirmation
	@user = current_user
end

private
   def goodbye_params
       params.require(:goodbye).permit(:user_id, :reason)
    end
end
