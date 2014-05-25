class UserMailer < ActionMailer::Base
  default from: "notifications@g2-social-network.com"

  def welcome_email(user)
    @user = user
    @url  = '/login'
    mail(to: @user.email, subject: 'Welcome to Lobb')
  end
end
