class RemoveDaysFromCharts < ActiveRecord::Migration[6.0]
  def change

    remove_column :charts, :days, :string
  end
end
