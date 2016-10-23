class PagesController < ApplicationController
  def index
    if session[:user_id] != nil
      redirect_to '/tasks/index'
    end
  end
end
