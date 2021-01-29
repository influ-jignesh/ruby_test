class UsersController < ApplicationController

	before_action :require_same_user, only: [:edit, :update, :destroy]


	def index
		#@users = User.all
		@users = User.paginate(page: params[:page], per_page: 6)
	end
	
	def show
		@user = user_data
		@articles = @user.articles
	end

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "#{@user.username} signup Done!"
			session[:user_id] = @user.id
			redirect_to users_path
		else
			render 'new'
		end
	end

	def edit
		@user = user_data
	end

	def update
		@user = user_data
		if @user.update(user_params)
			flash[:notice] = "Details Updated Successfully"			
			redirect_to users_path
		else
			render "edit"
		end		
	end

	def destroy
		@user = user_data
		@user.destroy

		session[:user_id] = nil if @user == current_user

		

		flash[:notice] = "User Deleted Succesfully"
		redirect_to users_path
	end

	def user_data
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def require_same_user
		@user = user_data
		if current_user != @user && !current_user.admin?
			flash[:alert] = "You can only edit or delete your own account"
			redirect_to users_path
		end	
	end
end