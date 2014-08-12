class AddFieToNotesCorrected < ActiveRecord::Migration
  def change
  	add_column :notes, :fie, :string
  end
end
