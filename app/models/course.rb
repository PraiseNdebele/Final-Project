class Course < ActiveRecord::Base
	has_many :goals
	has_many :important
	has_many :tdl
	belongs_to :user
end
