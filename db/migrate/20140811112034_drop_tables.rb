class DropTables < ActiveRecord::Migration
  def change
  	drop_table :baskets
  	drop_table :basket_items
  	drop_table :sale_texts
  	
  end
end
