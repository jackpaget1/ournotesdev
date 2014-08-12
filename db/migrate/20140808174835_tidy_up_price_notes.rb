class TidyUpPriceNotes < ActiveRecord::Migration
  def change
  	remove_column :notes, :price
  	add_column :notes, :price, :decimal, :precision => 8, :scale => 2
  end
end
