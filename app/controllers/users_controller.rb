class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id].to_i)
  end

  def new
  end

  def create
  end

  private

  def user_params
  end
end
