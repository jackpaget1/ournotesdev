class AddPriceToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :price, :string
  end
end
