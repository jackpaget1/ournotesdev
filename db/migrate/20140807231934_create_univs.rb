class CreateUnivs < ActiveRecord::Migration
  def change
    create_table :univs do |t|
      t.string :field
      t.timestamps
    end
  end
end
