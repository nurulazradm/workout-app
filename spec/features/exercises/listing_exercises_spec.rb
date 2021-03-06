require 'rails_helper'

RSpec.feature "Listing Exercises", type: :feature do
  before do
    @user = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'secret')
    @friend = User.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'secret')
    login_as @user

    @ex1 = @user.exercises.create(
      duration_in_min: 20,
      workout: 'My body building activity',
      workout_date: Date.today
    )

    @ex2 = @user.exercises.create(
      duration_in_min: 55,
      workout: 'Weight lifting',
      workout_date: 2.days.ago
    )

    @ex3 = @user.exercises.create(
      duration_in_min: 35,
      workout: 'On treadmill',
      workout_date: 8.days.ago
    )

    @following = Friendship.create(user: @user, friend: @friend)
  end

  scenario "show user's workout for last 7 days" do
    visit root_path

    click_link "My Lounge"

    expect(page).to have_content @ex1.duration_in_min
    expect(page).to have_content @ex1.workout
    expect(page).to have_content @ex1.workout_date

    expect(page).to have_content @ex2.duration_in_min
    expect(page).to have_content @ex2.workout
    expect(page).to have_content @ex2.workout_date

    expect(page).not_to have_content @ex3.duration_in_min
    expect(page).not_to have_content @ex3.workout
    expect(page).not_to have_content @ex3.workout_date
  end

  scenario "shows no exercises if none created" do
    @user.exercises.delete_all

    visit root_path

    click_link "My Lounge"

    expect(page).to have_content 'No Workouts Yet'
  end

  scenario "shows a list of user's friends" do
    visit root_path

    click_link 'My Lounge'

    expect(page).to have_content 'My Friends'
    expect(page).to have_link @friend.full_name
    expect(page).to have_link 'Unfollow'
  end
end
