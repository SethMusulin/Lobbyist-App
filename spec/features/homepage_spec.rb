require 'spec_helper'

feature "Homepage" do
  scenario "Shows welcome message" do
  visit '/'

  expect(page).to have_content "About"
  click_link "About"
  expect(page).to have_content "Welcome"

  end
end
