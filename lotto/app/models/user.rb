class User < ActiveRecord::Base
    validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
    validates :password, length: { in: 4..20 }

end
