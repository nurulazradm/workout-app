require 'rails_helper'

RSpec.feature "Users signup", type: :feature do
  scenario "with valid credentials" do
    visit root_path

    click_link "Sign up"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")

    visit root_path

    expect(page).to have_content 'John Doe'
  end

  scenario "with invalid credentials" do
    visit root_path

    click_link "Sign up"
    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Sign up"

    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
  end
end
