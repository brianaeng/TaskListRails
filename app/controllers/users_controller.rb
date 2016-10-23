class UsersController < ApplicationController
  def index
  end

  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar = "default_icon.jpg"

    if @user.save
      session[:user_id] = @user.id
      redirect_to index_path
    else
      redirect_to new_user_path
    end
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
