require 'spec_helper'

feature "Homepage" do

  scenario "User can manage account" do
    visit '/'

    first(:link, "Register").click
    fill_in "Email", with: "seth@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Create User"

    click_link "Log out"

    fill_in "Email", with: "seth@example.com"
    fill_in "Password", with: "123456"
    click_button "Login"

    expect(page).to have_content("Log out")

  end
  scenario "user can reset their password" do
    user = User.create!(email: 'user@example.com', password: 'Password1')
    mail_sent = ActionMailer::Base.deliveries.length
    visit '/'

    click_link 'Forgot password?'

    fill_in 'Email', with: user.email
    click_button 'Reset Password'

    expect(ActionMailer::Base.deliveries.length).to eq (mail_sent + 1)
    expect(page).to have_content 'An email has been sent with instructions on how to reset your password'



    email_body = ActionMailer::Base.deliveries.last.body.raw_source
    @document = Nokogiri::HTML(email_body)
    result = @document.xpath("//html//body//a//@href")[0].value

    visit result

    fill_in 'Password', with: 'Password2'
    fill_in 'Password confirmation', with: 'Password2'
    click_on 'Update Password'

    expect(page).to have_content "Password Updated"

    visit '/'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'Password2'
    click_button 'Login'

    expect(page).to have_content user.email
    expect(page).to have_link 'Log out'
  end
end


