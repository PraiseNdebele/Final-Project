class Important < ActiveRecord::Base
	belongs_to :course
	belongs_to :user

	def self.upcoming
		where('date > ?', Time.now)
	end
end
