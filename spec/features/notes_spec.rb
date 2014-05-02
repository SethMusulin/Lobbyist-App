require 'spec_helper'

feature "Note Pad" do
  scenario "allows user to input a note and submit" do
    visit '/'
    click_link "Note Pad"
    click_link "Add New Note"
    fill_in "Tag", with: "test"
    fill_in "Title", with: "test"
    fill_in "Note", with: "This is a sweet test entry"
    click_on "Create Note"
    expect(page).to have_content "This is a sweet test entry"
    click_link "Note Pad"
    click_link "test"
    expect(page).to have_content "This is a sweet test entry"
  end
end

