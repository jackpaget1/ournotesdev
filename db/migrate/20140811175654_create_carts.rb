class CreateCarts < ActiveRecord::Migration
  def change
    
  	drop_table :carts

    create_table :carts do |t|

      t.timestamps
    end
  end
end
