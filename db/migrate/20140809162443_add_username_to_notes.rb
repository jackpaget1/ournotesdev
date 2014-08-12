class AddUsernameToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :uploader, :string, :default => 'jackpaget'
  end
end
