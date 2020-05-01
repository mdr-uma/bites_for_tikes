class ChartsController < ApplicationController
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

    private

    def chart_params
        params.require(:chart).permit(:date, :days, :time)
    end
end
