class MealController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
    @meal.meal_photos.build
  end

  def create
    @member = current_member
    @meal = current_member.meals.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to dashboard_path, notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:member_id, :name, :price, :recipe, :meal_photos_attributes => [:photo])
    end
end
