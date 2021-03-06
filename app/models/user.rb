class User < ApplicationRecord
	has_secure_password
	has_many :microposts

	before_save { self.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_NAME_REGEX = /\A[\w+\-.]/i

	validates :name, presence: true, length:{minimum: 6, maximum: 20},
			   format: { with: VALID_NAME_REGEX }
			   
	validates :email, presence: true, length:{maximum: 50},
			  format: { with: VALID_EMAIL_REGEX },
			  uniqueness: { case_sensitive: false }


	# returns a hash digest of a given string
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
	end

end
