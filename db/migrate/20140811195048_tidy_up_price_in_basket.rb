class TidyUpPriceInBasket < ActiveRecord::Migration
  def change
  	remove_column :baskets, :note_price
  	add_column :baskets, :note_price, :decimal, :precision => 8, :scale => 2
  end
end
