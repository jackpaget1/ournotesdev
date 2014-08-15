class AddDownloadedToCart < ActiveRecord::Migration
  def change
  	add_column :carts, :download, :integer
  end
end
