class AddProfileIdToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :profile_id, :string
  end
end
