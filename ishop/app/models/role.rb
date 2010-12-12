class Role < ActiveRecord::Base
	has_many :premissions
	has_many :users, :through => :premissions
end
