require 'rails_helper'

RSpec.feature "Users signup", type: :feature do
  scenario "with valid credentials" do
    visit root_path

    click_link "Sign up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end
end
