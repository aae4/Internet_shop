class UserController < ApplicationController

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
			flash[:notice] = "Hi #{@user.login}! Your account was successfully registered."
			redirect_to(:action => 'index')
		else
			render :action => "new"
		end
	end
	
	def update
		@user=User.find(params[:id])
		respond_to do |format| 
			if @user.update_attributes(params[:user])
				flash[:notice]="#{@user.login} data was updated"
				format.html {redirect_to(:action => 'index')}
			else
				format.html {render :action => "edit"}
			end
		end
	end

	def delete
		@user=User.find(params[:id])
		@user.delete
		respond_to do |format|
			redirect_to(users_url)
		end
	end

end
