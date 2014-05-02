require 'spec_helper'

feature "Feature Request" do
  scenario "user can add feature request" do
    visit '/'

    click_link "Feature Requests"
    fill_in "feature", with: "Allows user to keep notes inside the app"
    click_on "Add Feature Request"
    expect(page).to have_content "Allows user to keep notes inside the app"

  end
end