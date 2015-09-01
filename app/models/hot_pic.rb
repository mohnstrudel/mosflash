class HotPic < ActiveRecord::Base
	belongs_to	:product

	mount_uploader :hot_pic, HotPicUploader
end
