class MealsController < ApplicationController
    before_action :require_logged_in
    
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
            render :new
        end
    end

    def edit
        @meal = Meal.find(params[:id])
        if current_user.id != @meal.id
            redirect_to chart_meals_path(@meal.chart),
            alert: "You don't have access to edit this meal."
        end
    end

    def update
        @meal = Meal.find(params[:id])
        if @meal.update(meal_params) 
            redirect_to chart_meals_path(@meal.chart)
        else
            render :edit
        end
    end

    def destroy 
        @meal = Meal.find(params[:id])
        @meal.destroy
        redirect_to chart_meals_path(@meal.chart)
    end

    private

    def meal_params
        params.require(:meal).permit(:meal_name, :meal_type, :note, :chart_id, :user_id)
    end

end
