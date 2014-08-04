class Docnote < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader

	
end
