class Note < ActiveRecord::Base

	attr_accessible :name, :attachment, :profile_id, :cat, :fie, :year, :title, :institute, :grade, :verified, :price, :downloads, :uploader, :filename
	attr_writer	:current_step

	mount_uploader :attachment, AttachmentUploader

	validates :profile_id, presence: true
	validates_presence_of :cat, :if => lambda { |n| n.current_step == "type"}, :message => "Please select a category"
	validates_presence_of :fie, :if => lambda { |n| n.current_step == "field"}, :message => "Please select a field"
	validates_presence_of :title, :if => lambda { |n| n.current_step == "subject"}, :message => "All fields are mandatory"
	validates_presence_of :year, :if => lambda { |n| n.current_step == "subject"}, :message => "All fields are mandatory"
	validates_presence_of :grade, :if => lambda { |n| n.current_step == "subject"}, :message => "All fields are mandatory"
	validates_presence_of :institute, :if => lambda { |n| n.current_step == "subject"}, :message => "All fields are mandatory"
	validates_presence_of :attachment, :if => lambda { |n| n.current_step == "attachment"}, :message => "File Missing"
	has_many :baskets

	def current_step
		@current_step || steps.first
	end

	def next_step

		self.current_step = steps[steps.index(current_step)+1]

	end


	def previous_step
		self.current_step = steps[steps.index(current_step)-1]
	end

	def add_downloads 

	end

	def steps
		%w[type field subject attachment]
	end

	def first_step?
		current_step == steps.first
	end

	def last_step?
		current_step == steps.last
	end


end
