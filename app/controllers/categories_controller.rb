class CategoriesController < ApplicationController

  before_action :require_admin, only: [:new, :create]

  def index
    @categories = Category.all
    @items = []
  end

  def show
    @category = Category.find(params[:id])
    @items = []
  end

  def new
		@category = Category.new
  end

  def create
  	@category = Category.new(category_params)

		if @category.save
    	redirect_to @category
  	else
    	render 'new'
  	end
  end

  private
  def category_params
    params.require(:category).permit(:name, item_ids: [])
  end
end
