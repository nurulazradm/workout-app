require 'rails_helper'

RSpec.feature "Users sign out", type: :feature do
  before do
    @user = User.create!(email: 'user@example.com', password: 'secret')

    visit root_path

    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  scenario do
    visit root_path

    click_link "Sign out"

    expect(page).to have_content('Signed out successfully.')
  end
end
