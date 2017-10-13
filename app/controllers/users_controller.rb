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
      # flash[:success] = "Successfully created new user #{ params[:username] } with ID #{ params[:id] }"
      # session[:username] = user.username
      # redirect_to root_path
    end
  end

end
