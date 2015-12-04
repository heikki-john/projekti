class User < ActiveRecord::Base
    has_many :favorite_numbers
    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
    has_secure_password
    validates :password, presence: true, length: { in: 4..20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
    
end
