class Tdl < ActiveRecord::Base
	belongs_to :course
	belongs_to :user

	def self.complete
    course = Course.find(params[:course_id])
    tdl = course.tdls.find(params[:id])
    tdl.complete = true
  end
end
