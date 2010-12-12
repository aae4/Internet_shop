class AdminController < ApplicationController
	def login
		if request.post?
			user=User.auth(params[:login],params[:password])
			if user
				redirect_to(:action => 'index')
			else
				flash.now[:notice] = 'Incorrect datap, please retry again'
			end
		end
	end
	
	def current_admin
		@current_admin ||= session[:admin] && Admin.find_by_id(session[:user])) || :false
	end

	def index
	end
end
