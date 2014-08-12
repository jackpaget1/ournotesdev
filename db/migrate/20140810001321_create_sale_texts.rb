class CreateSaleTexts < ActiveRecord::Migration
  def change
    create_table :sale_texts do |t|
    	t.string :title
    	t.text :message
      t.timestamps
    end
  end
end
