require 'rails_helper'

RSpec.feature "Following Friends", type: :feature do
  before do
    @user = User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: 'password')
    @friend = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@example.com', password: 'password')

    login_as @user
  end

  scenario "if signed in" do
    visit root_path

    expect(page).to have_content @user.full_name
    expect(page).to have_content @friend.full_name

    href = "/friendships?friend_id=#{@user.id}"
    expect(page).not_to have_link('Follow', href: href)

    link = "a[href='/friendships?friend_id=#{@friend.id}']"
    find(link).click

    href = "/frienships?friend_id=#{@friend.id}"
    expect(page).not_to have_link('Follow', href: href)
  end
end
