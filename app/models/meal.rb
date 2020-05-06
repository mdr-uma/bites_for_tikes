class Meal < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :chart, optional: true

    validates :meal_name, presence: true
end
