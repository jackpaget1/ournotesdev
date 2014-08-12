class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
    	t.string :qual
    	t.string :category_id
    	t.string :field_id
    end
  end
end
