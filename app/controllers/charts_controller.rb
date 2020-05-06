class ChartsController < ApplicationController
    def index
        if params[:user_id].present?
            @user = User.find_by(id: params[:user_id])
            @charts = @user.charts
        else
            @charts = Chart.all
        end
    end
    
    def new
        @chart = Chart.new
    end
    
    def show
        @chart = Chart.find(params[:id])
    end
    
    def create
        @chart = Chart.new(chart_params)
        if @chart.save
            redirect_to chart_path(@chart)
        else
            render :new
        end
    end

    def edit
        @chart = Chart.find(params[:id])
    end

    def update
        @chart = Chart.find(params[:id])
        if @chart.update(chart_params) #(date: params[:chart][:date], days: params[:chart][:days], time: params[:chart][:time])
            redirect_to user_charts_path(current_user)
        else
            render :edit
        end
    end

    def destroy
        @chart = Chart.find(params[:id]) 
        @chart.destroy
        redirect_to user_charts_path(current_user)   
    end

    private

    def chart_params
        params.require(:chart).permit(:date, :days, :time)
    end
end
