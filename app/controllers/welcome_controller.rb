class WelcomeController < ApplicationController
  def index

  	if user_signed_in?
		@next = Important.upcoming.where(:user_id => current_user.id).order(:date).first
	end

  	@users = User.all
  end


