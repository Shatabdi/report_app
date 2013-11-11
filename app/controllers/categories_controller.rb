class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def edit
		@category = Category.where(:id => params[:id]).first
	end

	def update
		@category = Category.where(:id => params[:id]).first
		if @category.update_attributes(params[:category])
			redirect_to categories_path
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.where(:id => params[:id]).first
		if @category.destroy
			redirect_to categories_path
		end
	end

end
