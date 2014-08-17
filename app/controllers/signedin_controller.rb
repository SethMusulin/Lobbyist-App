class SignedinController < ApplicationController
  before_action :require_authentication

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def require_authentication
    unless current_user
      redirect_to '/users', notice: "You must be signed in to access this page"
    end

  end
end
