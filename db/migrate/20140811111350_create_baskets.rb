class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|

    	t.integer :cart_id
    	t.integer :note_id
    	t.string :buyer_email

      t.timestamps
    end
  end
end
