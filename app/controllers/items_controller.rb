class ItemsController < ApplicationController

	before_action :require_admin, only: [:new, :create, :update, :destroy]

  def index
    @items = Item.all
    @categories = []
		@categories_list = Category.all # para fazer o filtro
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
	  @item = Item.new
  end

  def edit
  	@item = Item.find(params[:id])
	end

  def create
  	@item = Item.new(item_params)

	  if @item.save
      redirect_to @item
  	else
    	render 'new'
  	end
  end

  def update
	  @item = Item.find(params[:id])

	  if @item.update(item_params)
	    redirect_to @item
	  else
	    render 'edit'
	  end
	end

	def destroy
    @item = Item.find(params[:id])

    session[:current_cart] = {}

    @item.destroy

    redirect_to items_path
  end

private
  def item_params
    params.require(:item).permit(:name, :description, :price, category_ids: [], order_ids: [])
  end
end
