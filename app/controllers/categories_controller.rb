class CategoriesController < ApplicationController
	before_action :set_category, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]


	def show
		@posts = @category.posts.paginate(:page => params[:page], :per_page => 12).order("created_at DESC")
	end



  	private


  	def set_category
  		@category = Category.find(params[:id])
  	end

  	
	
end
