class CreateUnigs < ActiveRecord::Migration
  def change
    create_table :unigs do |t|
    	t.string :grade
      t.timestamps
    end
  end
end
