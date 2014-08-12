class RemoveColumnsFromBasket < ActiveRecord::Migration
  def change
  	remove_column :baskets, :price
  	remove_column :baskets, :note_id
  	remove_column :baskets, :completed_at
  end
end
