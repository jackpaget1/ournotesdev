class AddFileProfileIdToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :file_profile_id, :string,:null => false
  end
end
