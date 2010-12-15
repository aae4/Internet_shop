# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	$title="Интернет магазин lav44, psa31, aae4"
	$keywords="интернет магазин, каталоги, товары"
	$description="Нужно реализовать интернет магазин..."
	def catalogs_select(field)
		ws = []
		Catalog.find(:all).each{|i| ws << [i.name, i.id]}
		select_tag(field, options_for_select(ws))
	end
	def catalogs_id(s)
		Catalog.find(:all, :conditions => "id=#{s}")
	end
	def catalogs_list()
		Catalog.find(:all)
	end
	def goods_list(s)
		Good.find(:all, :conditions => "catalog_id=#{s}")
	end

end
