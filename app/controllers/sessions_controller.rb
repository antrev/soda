class SessionsController < ApplicationController

	def new
		
	end

	def create
		@user = User.find_by(:email => params[:session][:email])
		puts @user
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to @user
		else
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end
end
