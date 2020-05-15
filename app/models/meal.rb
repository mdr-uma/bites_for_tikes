class Meal < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :chart, optional: true

    validates :meal_name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
end
