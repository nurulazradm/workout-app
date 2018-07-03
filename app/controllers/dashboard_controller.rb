class DashboardController < ApplicationController
  def index
    @athletes = User.order(first_name: :asc)
  end
end
