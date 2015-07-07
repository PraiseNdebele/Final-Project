class Upload < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  # has_attached_file :document, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :document, :content_type => /\Aimage\/.*\Z/

	has_attached_file :document
	validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
