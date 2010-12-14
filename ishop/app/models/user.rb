class User < ActiveRecord::Base
	has_many :premissions
  	has_many :roles, :through => :premissions
	has_one :trash
	has_many :orders
	validates_presence_of :login
	validates_uniqueness_of :login
	
	attr_accessor :password_confirmation
	validates_confirmation_of :password
	
	def self.auth(login, password)
		user=self.find_by_login(login)
		user
	end

	def has_role?(name)
    		self.roles.find_by_login(login) ? true : false
  	end
end
