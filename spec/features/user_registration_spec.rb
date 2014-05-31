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

    first(:link, "Login").click
    fill_in "Email", with: "seth@example.com"
    fill_in "Password", with: "123456"
    click_button "Login"

    expect(page).to have_content("Log out")

    click_link "seth@example.com"
    expect(page).to have_content("Profile")


end
end


