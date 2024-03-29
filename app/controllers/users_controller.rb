class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:sucess] = "Bem-vindo ao DinnerDash #{@user.username}"
      redirect_to items_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Sua conta foi atualizada com sucesso."
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private
     def user_params
        params.require(:user).permit(:username, :email, :password, :name, :password_confirmation, :address, :admin)
     end
     def set_user
        @user = User.find(params[:id])
     end

end
