class CreateCharts < ActiveRecord::Migration[6.0]
  def change
    create_table :charts do |t|
      t.datetime :date
      t.datetime :time
      
      t.timestamps
    end
  end
end
