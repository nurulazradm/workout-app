require 'rails_helper'

RSpec.feature "Listing Members", type: :feature do
  before do
    @user = User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: 'password')
    @friend = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@example.com', password: 'password')
  end

  scenario "shows a list of registered members" do
    visit root_path

    expect(page).to have_content 'Listing of Members'
    expect(page).to have_content @user.full_name
    expect(page).to have_content @friend.full_name
  end
end
