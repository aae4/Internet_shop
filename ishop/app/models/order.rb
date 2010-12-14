class Order < ActiveRecord::Base
	has_many :goods
	belongs_to :user
end
