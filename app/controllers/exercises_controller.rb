class ExercisesController < ApplicationController

  def index

  end

  def new
    @user = current_user
    @exercise = @user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      redirect_to user_exercise_path(current_user, @exercise), notice: 'Exercise has been created'
    else
      render :new, notice: 'Exercise has not been created'
    end
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end
end
