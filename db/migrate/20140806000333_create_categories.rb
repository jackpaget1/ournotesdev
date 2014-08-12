class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

    	t.string :type_of_note

      t.timestamps
    end
  end
end
