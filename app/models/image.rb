class Image < ActiveRecord::Base
  belongs_to :product

  mount_uploader :image, ImageUploader

  validates_presence_of :image
end
