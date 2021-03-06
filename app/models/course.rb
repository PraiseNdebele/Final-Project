class Course < ActiveRecord::Base
	belongs_to :user
	has_many :goals, dependent: :destroy
	has_many :importants, dependent: :destroy
	has_many :tdls, dependent: :destroy
	has_many :uploads, dependent: :destroy
	validates :end_date, :name, presence: true

end
