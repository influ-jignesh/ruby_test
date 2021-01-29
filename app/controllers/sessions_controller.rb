class SessionsController < ApplicationController

	def new
		
	end	

	def create

		user = User.find_by(email: params[:session][:email].downcase)
		
		if user && user.authenticate(params[:session][:password])	
			session[:user_id] = user.id
			flash[:notice] = "Wellcome #{user.username}"
			redirect_to articles_path
		else
			flash.now[:alert] = "Somethings Worng With Your Credentails"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You Logged Out"
		redirect_to root_path
	end
end