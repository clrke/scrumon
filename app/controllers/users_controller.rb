class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.create params[:user].permit(:username, :email, :password, :password_confirmation)

		if @user.save
			redirect_to sessions_new_path
		else
			flash[:error] = "Invalid credentials"
			render action: "new"
		end
	end

	def show
		@user = current_user
		if @user.nil?
			redirect_to sessions_new_path
		end
	end
end
