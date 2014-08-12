class AddFieToNotes < ActiveRecord::Migration
  def change
  	add_column :fields, :fie, :string
  end
end
