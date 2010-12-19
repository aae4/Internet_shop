class UserController < ApplicationController
       before_filter :authorizeadm, :only => [:index, :destroy]
	layout "main"

	def index
		@user=User.find(:all, :order => :login)
		respond_to do |format|
  			format.html # index.html.erb
  			format.xml { render :xml => @users }
		end
	end

	def show
		@user=User.find(params[:id])
	end
	
	def new
		@user=User.new
	end

	def edit
		@user=User.find(params[:id])
	end
	
	def create
		@user=User.new(params[:user])
		if @user.save
			@user.created_at=Time.now
			session[:user] = @user
			flash[:notice] = "Hi #{@user.login}! Your account was successfully registered."
			redirect_to(:action => 'my_cab')
		else
			flash[:notice] = "Incorrect data. Check the errors please"
			render :action => "new"
		end
	end
	
	def update
		@user=User.find(params[:id])
			if @user.update_attributes(params[:user])
				flash[:notice]="#{@user.login} data was updated."
				render :action => "my_cab"
				#redirect_to(:action => 'my_cab')
			else
				render :action => "edit"
			end
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		respond_to do |format|
			format.html { redirect_to(users_url) }
    		end
  	end
	
	def login
	  if request.post?
	    @user = User.auth(params[:login], params[:password])
	    if @user
	      	session[:user] = @user
		uri = session[:original_uri]
		session[:original_uri] = nil
		flash[:notice]="Login Success"
	      	redirect_to(uri || {:action => "my_cab"} )
	    else
	      flash.now[:notice] = "Invalid user/password combination"
	    end
	  end
	end

	def logout
		reset_session
		flash[:notice] = "You have been logged out."
		redirect_to(:controller => 'main',:action => 'index')
	end

	def my_cab
		@user=session[:user]
	end


	def current_user
	  @current_user ||=(session[:user] && User.find_by_id(session[:user])) || :false
	end
  


end
