# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :user_class 


  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '8639cb5f1105d1a059db6624c8f6fe52'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  def user_class()
    @user
  end

	protected
  def authorizeadm
    unless User.find_by_id(session[:user]) && (User.find_by_id(session[:user])).login=='admin'
      flash[:notice] = "Доступ запрещен"
      redirect_to :controller => 'user' , :action => 'login'
    end
  end
   def authorizeusr
    unless User.find_by_id(session[:user]) 
      flash[:notice] = "Пожалуйста, авторизуйтесь"
      redirect_to :controller => 'user' , :action => 'login'
    end
  end

def goods_list(s)
Good.find(:all, :conditions => "catalog_id=#{s}")
end

end
