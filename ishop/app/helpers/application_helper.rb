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


def ordernew()
	if  Order.find(:first, :conditions => ["user_id=#{session[:user].id} AND status=0"]) 
		@order=Order.find(:first, :conditions => ["user_id=#{session[:user].id} AND status=0"])
	else
		@order=Order.create(:user_id => session[:user].id, :status => 0)
	end
end

def bu(goodid, qu)
	@buy = Buy.create(:good_id => goodid, :quant => qu, :order_id => ordernew().id)

end
	
def goods_list(s)
	Good.find(:all, :conditions => "catalog_id=#{s}")
end

def buys_list(s)
	Buy.find(:all, :conditions => "order_id=#{s}")
end

def good_name(s)
	Good.find(:first, :conditions => "id=#{s}")
end
def username_order(s)
	User.find(:first, :conditions => "id=#{s}")
end

def trash_fin()
	if username_order(session[:user].id).login=='admin'
		Order.find(:all, :conditions => "status=0")
	else
		Order.find(:all, :conditions => "user_id=#{session[:user].id} and status=0")
	end
end

def orders_fin()
	if username_order(session[:user].id).login=='admin'
		Order.find(:all, :conditions => "status=1 or status=2 or status=3")
	else
		Order.find(:all, :conditions => "user_id=#{session[:user].id} and (status=1 or status=2 or status=3)")
	end
end
def orders_status(s)
	if s==1
		return "Проверка администратором"
	elsif s==2
		return "Оплата и доставка"
	else
		return "Выполнен"
	end
end
end
