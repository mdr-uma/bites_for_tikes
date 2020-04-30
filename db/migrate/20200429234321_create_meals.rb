class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :type
      t.string :meal_name
      t.text :note
      t.belongs_to :user
      t.belongs_to :chart
      
      t.timestamps
    end
  end
end
