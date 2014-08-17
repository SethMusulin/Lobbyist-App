require 'spec_helper'

feature "Note Pad" do
  scenario "allows user to input a note and submit" do
    visit '/dashboard'

    click_link "N o t e s"
    expect(page).to have_content"You must be signed in to access this page"

    first(:link, "Register").click
    fill_in "Email", with: "seth@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Create User"

    click_link "N o t e s"
    click_link "Add New Note"
    fill_in "Tag", with: "test"
    fill_in "Title", with: "test"
    fill_in "Note", with: "This is a sweet test entry"
    click_on "Create Note"
    expect(page).to have_content "test"
    click_link "N o t e s"
    click_link "test"
    expect(page).to have_content "This is a sweet test entry"
    click_link "Edit Note"
    fill_in "Tag", with: "edit test"
    fill_in "Title", with: "edit test"
    fill_in "Note", with: "This is a sweet test entry, and its edited counterpart"
    click_on "Update Note"
    expect(page).to have_content "edit test"
    expect(page).to have_content "edit test"
    expect(page).to have_content "This is a sweet test entry, and its edited counterpart"
    click_on "Delete"
    expect(page).to_not have_content "edit test"
  end
end

