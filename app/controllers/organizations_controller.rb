class OrganizationsController < ApplicationController
  def index
  	check_auth
  end

  def new
  	check_auth
  end

  def edit
  	check_auth
  end

  def show
  	check_auth
  end

  def check_auth
  	@user = current_user
  	if @user.nil?
  		redirect_to sessions_new_path
  	end
  end
end
