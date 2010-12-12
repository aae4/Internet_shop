class RoleController < ApplicationController
	def index
		@roles=Role.find(:all)
	end
	
	def update
		@role=Role.find(params[:id])
		unless @user.has_role?(@role.name)
			@user.roles << @role
		end
		reirect_to user_roles_path(@user)
	end

	def destroy
		@role=Role.find(params[:id])
		if @user.has_role?(@role.name)
			@user.roles.delete(@role)
		end
		redirect_to user_path(@user)
	end

	def find_user
		@user = User.find(params[:user_id])
	end

end	
