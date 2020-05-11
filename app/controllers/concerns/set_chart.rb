module SetChart
    def set_chart(params)
        redirect_to root_path, alert: "Chart not found" unless @chart = Chart.find_by(id: params)
    end
end