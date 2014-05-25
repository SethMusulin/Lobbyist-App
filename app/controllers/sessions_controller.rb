class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Login Successful, Welcome #{user.email}"
      redirect_to '/dashboard'
    else
      flash.now[:error] = "Invalid Email and Password Combination"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/dashboard'
  end
end


