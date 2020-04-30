class Meal < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :chart, optional: true

end
