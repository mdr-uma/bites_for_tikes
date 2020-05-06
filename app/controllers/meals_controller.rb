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
            render :new
        end
    end

    def edit
        @meal = Meal.find(params[:id])
    end

    def update
        @meal = Meal.find(params[:id])
        if @meal.update(meal_params) #(meal_name: params[:meal][:meal_name], meal_type: params[:meal][:meal_type], note: params[:meal][:note])
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
