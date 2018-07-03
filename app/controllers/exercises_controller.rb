class ExercisesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :show]

  def index
    @exercises = @user.exercises
  end

  def new
    @exercise = @user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      redirect_to user_exercise_path(current_user, @exercise), notice: 'Exercise has been created'
    else
      flash.now[:alert] = 'Exercise has not been created'
      render :new
    end
  end

  def show
    @exercise = @user.exercises.find(params[:id])
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end

  def set_user
    @user = current_user
  end
end
