class Meal < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :chart, optional: true

    validates :meal_name, :meal_type, presence: true
end
