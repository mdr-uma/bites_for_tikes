class ChartsController < ApplicationController
    include SetChart
    before_action :require_logged_in
    before_action only: [:show, :edit, :update, :destroy] do
        set_chart(params[:id])
    end

    
    def index   
        @charts = Chart.most_recent   
    end

    def search
        if params[:search].blank?  
            redirect_to(root_path, alert: "Empty field!")
        else  
            @charts = Chart.search(params[:search])
        end  
    end
    
    def new
        @chart = Chart.new
    end
    
    def show
    end
    
    def create
        @chart = Chart.new(chart_params)
        if @chart.save
            redirect_to chart_path(@chart), notice: "Successfully created a chart."
        else
            render :new
        end
    end

    def edit
        if @chart.users.first && current_user.name != @chart.users.first.name
            redirect_to charts_path, alert: "You don't have access to edit this chart."
        end
    end

    def update
        if @chart.update(chart_params) 
            redirect_to charts_path
        else
            render :edit
        end
    end

    def destroy
        @chart.destroy
        redirect_to charts_path   
    end

    private

    def chart_params
        params.require(:chart).permit(:date, :time)
    end
   
end
