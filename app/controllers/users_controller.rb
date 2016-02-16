class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			login(@user)
			redirect_to user_path(@user.id)
		else
			flash[:danger] = "Invalid signup"
			redirect_to signup_path
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy

	end

	private
		def user_params
			params.require(:user).permit(:username,:password_digest,:email,:show_email)
		end
end
