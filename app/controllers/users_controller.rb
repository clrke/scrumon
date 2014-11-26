class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.create params[:user].permit(:username, :email, :password, :password_confirmation)

		if @user.save
			redirect_to sessions_new_path, notice:
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

	def join
		begin
			@org = Organization.find(params[:org_id])
			@user = User.find_by! username: params[:username]

			p @user.organizations.exists? :id => @org.id

			if @user.organizations.exists? :id => @org.id
				flash[:error] = "User \"#{params[:username]}\" is already in this group!"
				redirect_to :back
			else
				@user.organizations << @org
				redirect_to organization_path(@org), notice: "Successfully added #{params[:username]} to the group!"
			end

		rescue ActiveRecord::RecordNotFound
			flash[:error] = "User \"#{params[:username]}\" does not exist!"
			redirect_to :back
		end
	end

	def leave
		@org = Organization.find(params[:id])
		current_user.organizations.delete(@org)

		redirect_to users_show_path
	end
end
