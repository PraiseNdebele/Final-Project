class UsersController < ApplicationController
	def index
	end

	def search
   	@users = User.search(params[:q])
  	end
end
