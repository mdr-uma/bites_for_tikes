class MealsController < ApplicationController

    # def index
    #     if params[:chart_id]
    #     @chart = Chart.find_by(id: params[:chart_id])
    #         if @chart.nil?
    #             redirect_to charts_path, alert: "Chart not found"
    #         else
    #             @meals = @chart.meals
    #         end
    #     else
    #         @meals = Meal.all
    #     end
    # end
    def index
        if params[:chart_id].present?

            @chart = Chart.find_by(id: params[:chart_id])
            @meals = @chart.meals
        else
            @meals = Meal.all
        end
    end

    def new
        @chart = Chart.find_by(id: params[:chart_id])
        @meal = @chart.meals.build
    end

    def show
        @meal = Meal.find(params[:id])
    end

    def create
        @meal = Meal.new(meal_params)
        if @meal.save
            redirect_to chart_meals_path(@meal.chart)
        else
            redirect_to new_meal_path
        end
    end

    private

    def meal_params
        params.require(:meal).permit(:meal_name, :meal_type, :note, :chart_id)
    end

end
