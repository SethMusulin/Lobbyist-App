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


end