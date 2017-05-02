class User < ApplicationRecord
	has_secure_password
	has_many :microposts
	attr_accessor :remember_token
	attr_accessor :blah

	before_save { self.name.downcase!; self.email.downcase! }

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

	def User.new_token
		return SecureRandom.urlsafe_base64
	end


	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(self.remember_token))
	end
end
