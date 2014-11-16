class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:session][:username], params[:session][:password])

		if user.nil?
			flash.now[:error] = "Invalid username/password combination."
			render :new
		else
			sign_in user
			redirect_to users_show_path
		end
	end

	def destroy
		sign_out
		redirect_to sessions_new_path
	end
end
