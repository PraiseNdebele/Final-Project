class Course < ActiveRecord::Base
	belongs_to :user
	has_many :goals
	has_many :importants
	has_many :tdls
end
