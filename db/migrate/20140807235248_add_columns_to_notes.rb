class AddColumnsToNotes < ActiveRecord::Migration
  def change

  	add_column :notes, :year, :string
  	add_column :notes, :title, :string
  	add_column :notes, :institute, :string
  	add_column :notes, :grade, :string

  end
end
