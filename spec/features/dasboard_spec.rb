require 'spec_helper'

feature "Dashboard" do
  scenario "lists users notes and searches" do
    user = create_user
    note = create_note(:user_id => user.id)
    searches =create_search(:user_id => user.id)


    visit '/'

    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password1"
    click_button "Login"

    expect(page).to have_content("Test Note")
    expect(page).to have_content("CO")
    expect(page).to have_content("1030")
  end

  scenario "does not display a search that does not return results" do
    user = create_user
    visit '/'

    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password1"
    click_button "Login"

    visit '/dashboard'
    expect(page).to_not have_content "HB1030"
    click_link "Bill Tracker"
    fill_in "State Abbreviation", with: ""
    fill_in "Bill Number", with: "HB1030"
    click_on "Search"

    expect(page).to have_content "There was an error with your search, please try again"

    click_link "Dashboard"
    expect(page).to_not have_content "HB1030"

  end

end