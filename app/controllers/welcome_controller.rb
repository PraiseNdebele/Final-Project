class WelcomeController < ApplicationController
  def index
  	if user_signed_in?
		importants = Important.where(:user_id => current_user.id)
		importants = importants.sort_by &:date
		@next = importants.first
	end
end
end

