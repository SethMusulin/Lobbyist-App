class ResetPasswordsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      UserMailer.forgot_password(@user).deliver
    end

    redirect_to '/log_in', notice: 'An email has been sent with instructions on how to reset your password'
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(password: params[:user][:password])
    redirect_to '/log_in', notice: "Password Updated"
  end
end