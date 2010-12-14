module GoodsHelper
	
	def catalog_name(s)
		Catalog.find(:all, :conditions => "id = #{s}")
	end
	
end
