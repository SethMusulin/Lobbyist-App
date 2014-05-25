class WelcomeController < ApplicationController

  layout "welcome_index"

  def index
    user_id = session[:user_id]

    if !user_id.nil?
      @user = User.find(user_id)
    end

  end

  def about
  end
end