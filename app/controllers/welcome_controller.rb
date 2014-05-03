class WelcomeController < ApplicationController
  def index
    user_id = session[:user_id]

    if !user_id.nil?
      @user = User.find(user_id)
    end
  end

  def about

  end
end