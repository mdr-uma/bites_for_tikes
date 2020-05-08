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
            redirect_to chart_path(@chart),
            notice: "Successfully created a chart."
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
            redirect_to charts_path
        else
            render :edit
        end
    end

    def destroy
        @chart = Chart.find(params[:id]) 
        @chart.destroy
        redirect_to charts_path   
    end

    private

    def chart_params
        params.require(:chart).permit(:date, :time)
    end
end
