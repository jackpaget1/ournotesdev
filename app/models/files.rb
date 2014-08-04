class Files < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	validates :category, presence: true
end
