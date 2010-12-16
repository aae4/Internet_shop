class User < ActiveRecord::Base
	validates_presence_of :login, :email,:password
	validates_length_of	:login, :within => 3..25
	validates_length_of	:email, :within => 6..40
	validates_uniqueness_of :login, :email, :case_sensivity => false
	
	attr_accessor :password_confirmation
	validates_confirmation_of :password
		

	def self.auth(login, password)
	  find_by_login_and_password(login, password)
	end

	
end
