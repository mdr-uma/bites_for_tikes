class ChartsController < ApplicationController
    def index
        @charts = Chart.all
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
        if @chart.update(date: params[:chart][:date], days: params[:chart][:days], time: params[:chart][:time])
            redirect_to charts_path
        else
            render :edit
        end
    end

    private

    def chart_params
        params.require(:chart).permit(:date, :days, :time)
    end
end
