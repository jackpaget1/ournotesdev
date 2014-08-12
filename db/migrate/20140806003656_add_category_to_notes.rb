class AddCategoryToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :category_id, :int
  end
end
