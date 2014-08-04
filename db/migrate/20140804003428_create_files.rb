class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.string :profile_id
      t.string :category
      t.string :field
      t.string :subtype
      t.string :file_name
      t.string :preview_file_name
      t.string :price
      t.string :downloads

      t.timestamps
    end
  end
end
