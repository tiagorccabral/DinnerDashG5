class CartsController < ApplicationController

	before_action :set_cart

	def add
    if params[:item]
      @quantity = (params[:item][:quantity]).to_i
    else
      @quantity = 1
    end
    @item = Item.find(params[:id])
    @user = current_user
    user_cart = {@item.name => @quantity}

    if logged_in?
      chave = @user.username
    else
      chave = "not_logged"
    end

    if (!session[:current_cart].key? (chave))
      session[:current_cart][chave] = user_cart
    elsif (session[:current_cart][chave].key? (@item.name))
      session[:current_cart][chave][@item.name] += @quantity
    else
      session[:current_cart][chave].merge!(user_cart)
    end
    redirect_to items_path
	end

	def remove
    @item = Item.find(params[:id])
    @quantity = (params[:item][:quantity]).to_i
    @user = current_user

    if logged_in?
      chave = @user.username
    else
      chave = "not_logged"
    end

    if session[:current_cart].key? (chave)
      if session[:current_cart][chave][@item.name] > @quantity
        session[:current_cart][chave][@item.name] -= @quantity
      else
        session[:current_cart][chave].delete(@item.name)
        if session[:current_cart][chave].empty?
          session[:current_cart].delete(chave)
        end
      end
    end
    redirect_to items_path
  end

private
	def set_cart
		session[:current_cart] ||= {}
	end
end
