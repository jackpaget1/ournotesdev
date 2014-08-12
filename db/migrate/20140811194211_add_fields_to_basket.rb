class AddFieldsToBasket < ActiveRecord::Migration
  def change
  	add_column :baskets, :note_field, :string
  end
end
