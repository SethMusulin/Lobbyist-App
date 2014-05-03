class UsersController < ApplicationController

  def new
  @user = User.new
  end

  def create
  @user = User.new
  @user.email = params[:user][:email]
  @user.password_digest = params[:user][:password]
  @user.save
  session[:user_id] = @user.id

  redirect_to '/'
  end

end