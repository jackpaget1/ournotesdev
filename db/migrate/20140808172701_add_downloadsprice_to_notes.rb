class AddDownloadspriceToNotes < ActiveRecord::Migration
  def change
  	remove_column :notes, :price
  	add_column :notes, :price, :decimal
  	add_column :notes, :downloads, :int
  end
end
