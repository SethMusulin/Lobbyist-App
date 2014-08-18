class WelcomeController < ApplicationController

  layout "welcome_index"

  def index
    if logged_in?
      redirect_to '/dashboard'
    end
  end

end