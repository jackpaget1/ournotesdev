class CreateTextbs < ActiveRecord::Migration
  def change
    create_table :textbs do |t|
      t.string :field
      t.timestamps
    end
  end
end
