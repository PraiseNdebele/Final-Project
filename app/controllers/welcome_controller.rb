class WelcomeController < ApplicationController
  def index
  	@users = User.all
	@next = Important.upcoming.where(:user_id => current_user.id).order(:date).first
	
  end
end

