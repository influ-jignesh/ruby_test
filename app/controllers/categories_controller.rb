class CategoriesController < ApplicationController

	before_action :require_same_user, only: [:view_all_categories, :view_add_category, :add_category, :edit_category, :update_category, :delete_category]

	def view_all_categories
		@categories = Category.all
		render "categories/view"
	end


	def view_add_category
		
		# @categories = Category.new		

		render "add_view"	
	end

	def add_category
		@category_name = params[:name]		
		
		@categories = Category.new(name: @category_name)
		if @categories.save
			flash[:notice] = "Category Added Successfully"
			redirect_to categories_path
		else
			render :add_view
		end
	end


	def edit_category
		@category_name = params[:catname]		
	
		@categories = Category.find_by(name: @category_name)

		render "categories/edit_view"	
	end

	def update_category
		@category_id = params[:id]
		
		@categories = Category.update(@category_id, name: params[:name])
		
		if @categories
			flash[:notice] = "Category Updated Successfully"
			redirect_to categories_path
		else
			render :edit
		end
	end

	def delete_category
		@category_name = params[:catname]		
		
		@cate_data = Category.find_by(name: @category_name)

		Category.destroy(@cate_data.id)

		#Category.where(name: @category_name).destroy_all

		flash[:notice] = "Category Deleted Successfully"
		redirect_to categories_path
	end
	
	def require_same_user
		if !current_user.admin?
			flash[:alert] = "You Are Not Admin"
			redirect_to root_path
		end	
	end

end