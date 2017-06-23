class ItemsController < ApplicationController

	before_action :set_cart

	def index
    @items = Item.all
    @categories = []
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

	def add_to_cart
    @item = Item.find(params[:id])
		@quantity = (params[:item][:quantity]).to_i
    if session[:current_cart].key? (@item.name)
      session[:current_cart][@item.name] += @quantity
    else
      session[:current_cart][@item.name] = @quantity
    end

    redirect_to items_path
	end

  def remove_from_cart
    @item = Item.find(params[:id])
    if session[:current_cart].key? (@item.name)
      if session[:current_cart][@item.name] > 1
        session[:current_cart][@item.name] -= 1
      else
        session[:current_cart].delete(@item.name)
      end
      redirect_to items_path
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
    @item.destroy

    redirect_to items_path
  end

private
  def item_params
    params.require(:item).permit(:name, :description, :price, category_ids: [])
  end

	def set_cart
		session[:current_cart] ||= {}
	end
end
