class AddTermsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :terms_accepted, :string
  end
end
