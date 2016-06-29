class Maket < ActiveRecord::Base
  belongs_to :product

  mount_uploader :attachment, AttachmentUploader
end
