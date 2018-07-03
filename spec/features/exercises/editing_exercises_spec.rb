require 'rails_helper'

RSpec.feature "Editing Exercises", type: :feature do
  before do
    @user = User.create!(email: 'user@example.com', password: 'password')
    @user_exercise = @user.exercises.create!(
      duration_in_min: 48,
      workout: 'My body building activity',
      workout_date: Date.today
    )

    login_as @user
  end

  scenario "with valid data success" do
    visit root_path

    click_link 'My Lounge'

    path = "/users/#{@user.id}/exercises/#{@user_exercise.id}/edit"
    link = "a[href='#{path}']"
    find(link).click

    fill_in "Duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content 'Exercise has been updated'
    expect(page).to have_content 45
    expect(page).not_to have_content 48
  end
end
