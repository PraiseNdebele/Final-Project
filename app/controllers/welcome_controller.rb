class WelcomeController < ApplicationController
  def index
  	@users = User.all

  	if not(Important.all.empty?) and @next
	@next = Important.upcoming.where(:user_id => current_user.id).order(:date).first
	end
  end

end

