class Chart < ApplicationRecord
    has_many :meals
    has_many :users, through: :meals

    def normalize_date
        self.date = date.strftime("%B %d, %Y")
    end

    def normalize_time
        self.time = time.strftime("%I:%M %p")
    end
end
