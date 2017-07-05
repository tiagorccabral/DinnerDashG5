class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :count_items_and_price

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "Você precisa estar logado para fazer esta ação!"
      redirect_to root_path
    end
  end

  def count_items_and_price
    @total_products = 0
    @total_price = 0

    if (!logged_in?)
      if (session[:current_cart] != nil && session[:current_cart].key?("not_logged"))
        session[:current_cart]["not_logged"].each do |item|
          @total_products += item[1]
          @total_price += (Item.find_by_name(item[0])).price*item[1]
        end
      end
    else
      if (session[:current_cart] != nil && session[:current_cart].key?(current_user.id.to_s))
        session[:current_cart][current_user.id.to_s].each do |item|
          @total_products += item[1]
          @total_price += (Item.find_by_name(item[0])).price*item[1]
        end
      end
    end
    return @total_products, @total_price
  end
end
