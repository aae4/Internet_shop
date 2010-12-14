# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def catalogs_list(field)
		ws = []
		Catalog.find(:all).each{|i| ws << [i.name, i.id]}
		select_tag(field, options_for_select(ws))
	end
	
	def goods_list(field, s)
		ws = []
		Good.find(:all, :conditions => "catalog_id = #{s}").each{|i| ws << [i.name, i.id]}
		select_tag(field, options_for_select(ws))
	end
	
end
