require 'spec_helper'

feature "BillTracker" do
  scenario "it returns the user information on the requested bill" do
    visit '/'
    VCR.use_cassette('legiscan/bills3') do

      first(:link, "Register").click
      fill_in "Email", with: "seth@example.com"
      fill_in "Password", with: "123456"
      fill_in "Password confirmation", with: "123456"
      click_button "Create User"
      click_link "Bill Tracker"
      fill_in "State Abbreviation", with: "CO"
      fill_in "Bill Number", with: "HB1030"
      click_on "Search"
      expect(page).to have_content("2014 Regular Session")
      expect(page).to have_content("Sent to the Governor")
      expect(page).to have_content("Don Coram")
    end
  end
end