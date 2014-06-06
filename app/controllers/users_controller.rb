class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      session[:user_id] = @user.id
      flash[:register_message] = "Welcome #{@user.email}"
      redirect_to '/dashboard'
    else
      render '/users/new'
    end
  end

  def show
  end

  def user_params
    params.require(:user).permit(:email, :password,
        :password_confirmation)
  end
end