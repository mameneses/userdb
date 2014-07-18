class UsersController < ApplicationController

	def create
	  @user = User.create(username: params[:username], password: params[:password])
	  respond_to do |format|
			format.json { render json: @user}
		end	
	end

	def show
		user = User.find_by_username(params[:username])

		respond_to do |format|
			if user && user.password == params[:password]
				format.json { render json: user}
			else
				format.json { render json: false}
			end
		end
	end
end
