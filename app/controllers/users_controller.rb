class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    if user[:password] != user[:password_confirmation]
      redirect_to("/users/new")
      flash[:error] = "Passwords do not match"
    elsif
      user[:name].present? && user[:email].present? && user[:password].present? && user[:password_confirmation].present?
      user[:email] = user[:email].downcase
      new_user = User.create(user)
      session[:user_id] = new_user.id
      redirect_to("/users/#{new_user.id}")
      flash[:success] = "Welcome, #{new_user.name}!"
    else
      redirect_to("/users/new")
      flash[:error] = "Please fill in all fields"
    end 
  end

  def show
    @user = User.find(params[:id])
  end

  def login_form

  end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password] && params[:password_confirmation])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to("/users/#{user.id}")
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to("/login")
    end 
  end

  def logout
    session.clear
    flash[:notice] = "Successfully Logged Out"
    redirect_to("/")
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end