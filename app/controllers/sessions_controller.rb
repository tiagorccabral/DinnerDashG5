class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:cart_id] ||= user.id
      flash[:success] = "Login feito com sucesso..."
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Tem algo de errado com suas credenciais..."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Você fez log out"
    redirect_to root_path
  end

end
