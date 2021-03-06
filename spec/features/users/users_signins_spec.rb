require 'rails_helper'

RSpec.feature "Users signin", type: :feature do
  before do
    @user = User.create!(first_name: 'John', last_name: 'Doe', email: 'user@example.com', password: 'secret')
  end

  scenario "with valid credentials" do
    visit root_path

    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content("Signed in as #{@user.email}")
  end
end
