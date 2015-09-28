class Member < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
end
