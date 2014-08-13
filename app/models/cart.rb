class Cart < ActiveRecord::Base

	
	serialize :note_id
	attr_accessible :purchased_at

end
