class UserMailer < ActionMailer::Base
  default from: "https://shrouded-garden-8917"

  def welcome_email(user)
    @user = user
    @url  = '/login'
    mail(to: @user.email, subject: 'Welcome to Lobb')
  end
end
