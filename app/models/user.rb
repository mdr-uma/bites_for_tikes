class User < ApplicationRecord
    has_secure_password
    
    has_many :meals, dependent: :destroy
    has_many :charts, through: :meals

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { in: 6..20 }
end
