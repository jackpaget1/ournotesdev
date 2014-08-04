class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
    	t.string :profile_id
    	t.string :core
    	t.string :Specific
    	t.string :Creds
    	t.string :filename
    	t.string :preview_filename
    	t.string :price
    	t.string :downloads
    	t.string :earnings
      t.timestamps
    end
  end
end
