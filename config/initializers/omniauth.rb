# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :evernote, ENV['EN_CONSUMER_KEY'], ENV['EN_CONSUMER_SECRET']
# end
# #
config = YAML.load(ERB.new(File.read('config/evernote.yml')).result)[Rails.env]
# site = config['sandbox'] ? 'https://sandbox.evernote.com' : 'https://www.evernote.com'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :evernote, ENV['EN_CONSUMER_KEY'], ENV['EN_CONSUMER_SECRET']
end

OmniAuth.config.on_failure = EvernoteController.action(:failure)