class CartsController < ApplicationController

	before_action :set_cart

	def add
    @item = Item.find(params[:id])
		@quantity = (params[:item][:quantity]).to_i
    
    if session[:current_cart].key? (@item.name) 
      session[:current_cart][@item.name] += @quantity
    else
      session[:current_cart][@item.name] = @quantity
    end
    redirect_to items_path
	end

	def remove
    @item = Item.find(params[:id])
    @quantity = (params[:item][:quantity]).to_i

    if session[:current_cart].key? (@item.name)
      if session[:current_cart][@item.name] > @quantity
        session[:current_cart][@item.name] -= @quantity
      else
        session[:current_cart].delete(@item.name)
      end
      redirect_to items_path
    end
  end

private
	def set_cart
		session[:current_cart] ||= {}
	end
end