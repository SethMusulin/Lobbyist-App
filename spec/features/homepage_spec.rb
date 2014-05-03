require 'spec_helper'

feature "Homepage" do
  scenario "Shows welcome message" do
    visit '/'

    expect(page).to have_content "About"
    click_link "About"
    expect(page).to have_content "Welcome"
    click_link "Home"
    expect(page).to have_content "About"
  end

  scenario "User can register" do
    visit '/'

    click_link "Register"

    fill_in "Email", with: "mike@example.com"
    fill_in "Password", with: "123!@"
    click_button "Create User"

    expect(page).to have_content("Welcome, mike@example.com!")
  end
end

