class AddProfileIdToUsers < ActiveRecord::Migration
  def change

    add_column :users, :profile_name, :string,:default => "Uploader"
    add_column :users, :profile_id, :string,:null => false,:unique => true

  end
end
 
