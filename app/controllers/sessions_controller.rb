class SessionsController < ApplicationController
	def new 
		@no_header = true
	end

	def create
		user = User.find_by(username: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			login(user)
			redirect_to posts_path
		else
			flash[:danger] = "Invalid Login"
			redirect_to login_path
		end
	end

	def destroy
		logout
		redirect_to root_path
	end
end
