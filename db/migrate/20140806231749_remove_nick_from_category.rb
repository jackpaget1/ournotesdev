class RemoveNickFromCategory < ActiveRecord::Migration
  def self.up
  	remove_column :categories, :nickname
  end
end
