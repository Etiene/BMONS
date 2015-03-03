class User < ActiveRecord::Base

	validates :name,  presence: true, length: { maximum: 50 }
	validates :login,  presence: true, length: { maximum: 50 }                
    validates :access_level,  presence: true
    validates :tel,  presence: true

    
   
	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#validates :email, presence: true, length: { maximum: 255 },
    #                format: { with: VALID_EMAIL_REGEX },
    #                uniqueness: { case_sensitive: false }
    has_secure_password
    #validates :password, presence: true, length: { minimum: 6 }

                    

    
end
