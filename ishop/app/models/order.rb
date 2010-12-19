class Order < ActiveRecord::Base
	validates_numericality_of :status, :allow_nil => false, 
    :less_than => 4, :greater_than => -1,
    :message => 'Неверный статус заказа'

	belongs_to :user
	has_many :buys
end
