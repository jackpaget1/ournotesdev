class AddNoteIdsToCart < ActiveRecord::Migration
  def change
  	add_column :carts, :note_id, :text
  end
end
