class MealsController < ApplicationController
    include SetChart
    before_action :require_logged_in
    before_action :set_meal, only: [:show, :edit, :update, :destroy]
    before_action only: [:new] do
        set_chart(params[:chart_id])
    end
    
    
    def index
        if params[:chart_id].present?
            if @chart = Chart.find_by(id: params[:chart_id])
                @meals = @chart.meals
            else
                redirect_to charts_path, alert:"Chart not found"
            end
        else
            @meals = Meal.all
        end
    end

    def new
        # @chart = Chart.find_by(id: params[:chart_id])
        @meal = @chart.meals.build
    end

    def search
        @meals = Meal.meals_by_meal_type(params[:q]).meals_by_user(current_user)
    end

    def show
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
        if current_user.name != @meal.user.name
            redirect_to chart_meals_path(@meal.chart),
            alert: "You don't have access to edit this meal."
        end
    end

    def update
        if @meal.update(meal_params) 
            redirect_to chart_meals_path(@meal.chart)
        else
            render :edit
        end
    end

    def destroy 
        @meal.destroy
        redirect_to chart_meals_path(@meal.chart)
    end

    private

    def meal_params
        params.require(:meal).permit(:meal_name, :meal_type, :note, :chart_id, :user_id)
    end

    def set_meal
        redirect_to root_path, alert: "Meal not found" unless @meal = Meal.find_by(id: params[:id])
    end

end
