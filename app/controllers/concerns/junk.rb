require 'evernote_oauth'
client = EvernoteOAuth::Client.new(consumer_secret: 'sethmusulin', consumer_key:'825ada921204c470')
request_token = client.request_token(:oauth_callback => 'localhost:3000')
request_token.authorize_url

