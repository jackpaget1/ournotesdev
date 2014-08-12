class AddCatToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :cat, :string
  end
end
