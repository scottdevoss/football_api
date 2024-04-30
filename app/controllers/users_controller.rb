class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    redirect_to("/users/#{new_user.id}")
    flash[:success] = "Welcome, #{new_user.name}!"
  end

  def show
    @user = User.find(params[:id])
  end

  def login_form

  end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password] && params[:password_confirmation])
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to("/users/#{user.id}")
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end 
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end