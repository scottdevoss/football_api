class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    flash[:success] = "Welcome, #{new_user.name}!"
    redirect_to("/users/#{new_user.id}")
  end

  def show
    @user = User.find(params[:id])
  end

  def login_form

  end

  def login
    user = User.find_by(email: params[:email])
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end