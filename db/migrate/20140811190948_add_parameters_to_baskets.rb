class AddParametersToBaskets < ActiveRecord::Migration
  def change
  	add_column :baskets, :note_uploader, :string
  	add_column :baskets, :note_category, :string
  	add_column :baskets, :note_price, :integer
  end
end
