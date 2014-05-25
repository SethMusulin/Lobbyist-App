class UserMailer < ActionMailer::Base
  default from: "localhost:3000"

  def welcome_email(user)
    @user = user
    @url  = '/login'
    mail(to: @user.email, subject: 'Welcome to Lobb')
  end
end
