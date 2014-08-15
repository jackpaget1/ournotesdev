class TidyUp2Baskets < ActiveRecord::Migration
  def change
  	add_column :baskets, :downloaded, :integer, :default => 0
  end
end
