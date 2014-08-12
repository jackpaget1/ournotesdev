class CreateProffings < ActiveRecord::Migration
  def change
    create_table :proffings do |t|
    	t.string :grade
      t.timestamps
    end
  end
end
