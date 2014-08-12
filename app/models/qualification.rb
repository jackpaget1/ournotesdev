class Qualification < ActiveRecord::Base

	attr_accessible :qual, :field_id, :field_name

	belongs_to :fields

end