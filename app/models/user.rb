class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :courses, dependent: :destroy
  has_many :tdls, through: :courses
  has_many :goals, through: :courses
  has_many :importants, through: :courses
end
