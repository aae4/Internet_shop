class Buy < ActiveRecord::Base
	validates_numericality_of :quant, :allow_nil => false, 
	:greater_than => 0,
    	:message => 'нужно заказать хотя бы один товар'
	belongs_to :order
	belongs_to :good
end
