class DashboardController < ApplicationController

  def index
    @meal = Meal.new
    @meals = Meal.all
    @member = current_member
  end

end
