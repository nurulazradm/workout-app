require 'rails_helper'

RSpec.feature "Deleting Exercises", type: :feature do
  before do
    @user = User.create!(email: 'user@example.com', password: 'password')
    @user_exercise = @user.exercises.create!(
      duration_in_min: 48,
      workout: 'My body building activity',
      workout_date: Date.today
    )

    login_as @user
  end

  scenario do
    visit root_path

    click_link 'My Lounge'

    path = "/users/#{@user.id}/exercises/#{@user_exercise.id}"
    link = "//a[contains(@href, '#{path}') and .//text()='Destroy']"
    find(:xpath, link).click

    expect(page).to have_content 'Exercise has been deleted'
  end
end
