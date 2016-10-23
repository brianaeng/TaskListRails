class UsersController < ApplicationController
  def index
  end

  def show
    find_user
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def find_user
    @user = User.find(params[:id].to_i)
  end

end
