class User < ActiveRecord::Base
    has_many :favorite_numbers
    validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
    validates :password, presence: true, length: { in: 4..20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
end
