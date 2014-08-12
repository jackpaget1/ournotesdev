class Fields < ActiveRecord::Base

	attr_accessible :field_name, :category_id, :type_of_note

	has_many :qualifications

	belongs_to :category

end
