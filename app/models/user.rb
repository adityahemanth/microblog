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


end
