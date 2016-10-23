class SessionsController < ApplicationController
  def create
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

  def destroy
    session[:user_id] = nil
    redirect_to :back
  end

end