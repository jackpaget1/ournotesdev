class AddTypeToFields < ActiveRecord::Migration
  def change
  	add_column :fields, :category_id, :string
  end
end
