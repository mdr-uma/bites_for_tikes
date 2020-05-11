class Chart < ApplicationRecord
    scope :most_recent, -> {order("created_at desc")}
    has_many :meals, dependent: :destroy
    has_many :users, through: :meals

    validates :date, :time, presence: true

    def normalize_date
        date.strftime("%B %d, %Y")
    end

    def normalize_time
        time.strftime("%I:%M %p")
    end
end
