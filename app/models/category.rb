class Category < ActiveRecord::Base

	attr_accessible :type_of_note

	has_many :fields
	has_many :qualifications, :through => :fields

end
