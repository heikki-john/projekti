class User < ActiveRecord::Base
    has_many :favorite_numbers
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
    has_secure_password
    validates :password, presence: true, length: { in: 4..20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
    
  #return the hash digest of the given string
  def User.digest(str)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::ENGINE.cost
    BCrypt::Password.create(str, cost: cost)
  end
  
  #Returns random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  #Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  #Returns true if the given token matched the digest
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
