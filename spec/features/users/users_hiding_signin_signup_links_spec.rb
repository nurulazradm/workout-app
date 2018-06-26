require 'rails_helper'

RSpec.feature "Hiding signin link", type: :feature do
  before do
    @user = User.create!(email: 'user@example.com', password: 'secret')
  end

  scenario "upon successful signin" do
    visit root_path

    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"

    expect(page).to have_link 'Sign out'
    expect(page).not_to have_link 'Sign in'
    expect(page).not_to have_link 'Sign up'
  end
end
