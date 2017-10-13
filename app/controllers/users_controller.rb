class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id].to_i)
  end

  def login_form
  end

  def login
    user = User.find_by(username: params[:username])

    if user
      flash[:success] = "#{ user.username } is successfully logged in"
      session[:username] = user.id
      redirect_to root_path
    else
      user = User.create(username: params[:username])
      flash[:success] = "Successfully created new user #{ params[:username] } with ID #{ user.id }"
      session[:username] = user.username
      redirect_to users_path
    end
  end

  def destroy
    session[:username] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
