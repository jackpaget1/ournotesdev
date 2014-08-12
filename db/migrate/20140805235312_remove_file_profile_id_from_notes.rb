class RemoveFileProfileIdFromNotes < ActiveRecord::Migration
  def self.up
  	remove_column :notes, :file_profile_id
  end
end
