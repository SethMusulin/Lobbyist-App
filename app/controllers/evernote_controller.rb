class EvernoteController < ApplicationController


  def create
    auth = request.env["omniauth.auth"]
    session[:authtoken] = auth['credentials']['token']
    client = EvernoteOAuth::Client.new(token: session[:authtoken])
    note_store = client.note_store
    request_token = client.request_token(:oauth_callback => 'localhost:3000')
    user = User.find(current_user.id)
    user.update_attributes(provider: auth["provider"],uid: auth["uid"], access_token: session[:authtoken])
    redirect_to '/dashboard'
  end

  def failure
    redirect_to '/dashboard', flash: {:auth_failure => "Authorization with Evernote has failed, please retry."}
  end

end