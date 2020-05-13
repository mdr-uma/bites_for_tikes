class User < ApplicationRecord
    has_secure_password
    
    has_many :meals, dependent: :destroy
    has_many :charts, through: :meals

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { in: 6..20 }

    def self.find_or_create_by_omniauth(auth)
        oauth_email = auth["info"]["email"]
        self.where(:email => oauth_email).first_or_create do |user|
            user.password = SecureRandom.hex(10)
            user.name = auth["info"]["name"] || auth["info"]["nickname"]
        end
    end

end
