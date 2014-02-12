class Profile < ActiveRecord::Base
	validates_presence_of :user_id
	belongs_to :user

	mount_uploader :picture, PictureUploader
end
