class CreateTexgs < ActiveRecord::Migration
  def change
    create_table :texgs do |t|
      t.string :grade
      t.timestamps
    end
  end
end
