class MealsController < ApplicationController

    def index
        @meals = Meal.all
    end
    
    def new
        @meal = Meal.new
    end

    def show
        @meal = Meal.find(params[:id])
    end

    def create
        @meal = Meal.new(meal_params)
        if @meal.save
            redirect_to meal_path(@meal)
        else
            redirect_to new_meal_path
        end
    end

    private

    def meal_params
        params.require(:meal).permit(:meal_name, :meal_type, :note)
    end

end
