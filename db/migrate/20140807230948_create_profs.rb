class CreateProfs < ActiveRecord::Migration
  def change
    create_table :profs do |t|
      t.string :field
      t.timestamps
    end
  end
end
