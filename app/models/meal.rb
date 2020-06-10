class Meal < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :chart, optional: true

    validates :meal_name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }

     scope :meals_by_meal_type, -> (name) {where(meal_type: name)}
     scope :meals_by_user, -> (name) {where(user_id: name)}
    
end
