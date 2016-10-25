class SessionsController < ApplicationController
  def new
    if session[:user_id] != nil
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create_via_github
    auth_hash = request.env['omniauth.auth']

    flash[:notice] = "Login failed!"
    return redirect_to root_path unless auth_hash['uid']

    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if @user.nil?
      @user = User.build_from_github(auth_hash)
      flash[:notice] = "Unable to save user."
      return redirect_to root_path unless @user.save
    end

    session[:user_id] = @user.id
    flash[:notice] = "Successfully logged in!"
    redirect_to root_path
  end

  def create_via_login
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in!"
      redirect_to root_path
    else
      flash[:notice] = "Login failed!"
      redirect_to '/login', method: :get
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
