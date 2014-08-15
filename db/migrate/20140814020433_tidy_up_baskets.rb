class TidyUpBaskets < ActiveRecord::Migration
  def change
  	remove_column :baskets, :secure_string
  	add_column :baskets, :downloaded, :integer
  	add_column :baskets, :rand, :integer, :default => 8
  end
end
