class CreateDocnotes < ActiveRecord::Migration
  def change
    create_table :docnotes do |t|
      t.string :name
      t.string :attachment

      t.timestamps
    end
  end
end
