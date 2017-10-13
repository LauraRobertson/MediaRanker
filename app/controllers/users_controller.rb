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
  end

end
