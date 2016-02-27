class User < ActiveRecord::Base
  
	validates         :username, presence: true
	validates		  :password, :password_confirmation, presence: true
	has_secure_password
end