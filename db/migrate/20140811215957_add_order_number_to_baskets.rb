class AddOrderNumberToBaskets < ActiveRecord::Migration
  def change
  	add_column :baskets, :order_number, :string
  end
end
