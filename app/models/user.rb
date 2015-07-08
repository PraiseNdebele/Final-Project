class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :courses, dependent: :destroy
  has_many :tdls, through: :courses,dependent: :destroy
  has_many :goals, through: :courses, dependent: :destroy
  has_many :importants, through: :courses, dependent: :destroy
  has_many :uploads, through: :courses, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def self.search(query)
    User.where("institution LIKE ? or email LIKE ? or major LIKE ? or career_field LIKE ?", 
    "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}")
  end


end

