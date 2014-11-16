class UsersController < ApplicationController
  def new
  end
  def show
  	@user = current_user
  	if @user.nil?
  		redirect_to sessions_new_path
  	end
  end
end
