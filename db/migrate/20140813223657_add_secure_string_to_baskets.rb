class AddSecureStringToBaskets < ActiveRecord::Migration
  def change

  	add_column :baskets, :secure_string, :string
  end
end
