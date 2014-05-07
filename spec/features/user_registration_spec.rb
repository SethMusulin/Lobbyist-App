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

  scenario "User can register and log in " do
    visit '/'

    click_link "Register"
    fill_in "Email", with: "seth@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Create User"

    expect(page).to have_content("Welcome, seth@example.com!")

    click_link "Log out"
    expect(page).to_not have_content("Welcome, mike@example.com!")

    click_link "Log in"
    fill_in "Email", with: "seth@example.com"
    fill_in "Password", with: "123456"
    click_button "Log in"

    expect(page).to have_content("Welcome, seth@example.com!")

  end

end

