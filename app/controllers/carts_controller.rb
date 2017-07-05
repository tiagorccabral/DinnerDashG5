class CartsController < ApplicationController

	before_action :set_cart

	def add
    @item = Item.find(params[:id])
    @quantity = (params[:item][:quantity]).to_i

    if logged_in?  
      @user = current_user

      if session[:current_cart].key? ((@user.id).to_s)
        session[:current_cart][@user.id.to_s][@item.name] += @quantity
      else
        user_cart = {@item.name => @quantity}
        session[:current_cart][@user.id] = user_cart
      end
    else
      if session[:current_cart].key? ("not_logged")
        session[:current_cart]["not_logged"][@item.name] += @quantity
      else
        user_cart = {@item.name => @quantity}
        session[:current_cart]["not_logged"] = user_cart
      end      
    end
    redirect_to items_path
	end


	def remove
    @item = Item.find(params[:id])
    @quantity = (params[:item][:quantity]).to_i

    if logged_in?
      @user = current_user

      if session[:current_cart].key? (@user.id)
        if session[:current_cart][@user.id][@item.name] > @quantity
          session[:current_cart][@user.id][@item.name] -= @quantity
        else
          session[:current_cart].delete(@item.name)
        end
      end
    else
      if session[:current_cart].key? ("not_logged")
        if session[:current_cart]["not_logged"][@item.name] > @quantity
          session[:current_cart]["not_logged"][@item.name] -= @quantity
        else
          session[:current_cart].delete("not_logged")
        end
      end
      redirect_to items_path
    end
  end

private
	def set_cart
		session[:current_cart] = {}
	end
end
