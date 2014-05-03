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

