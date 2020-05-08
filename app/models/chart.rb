class Chart < ApplicationRecord
    has_many :meals, dependent: :destroy
    has_many :users, through: :meals

    validates :date, :days, :time, presence: true

    def normalize_date
        date.strftime("%B %d, %Y")
    end

    def normalize_time
        time.strftime("%I:%M %p")
    end
end
