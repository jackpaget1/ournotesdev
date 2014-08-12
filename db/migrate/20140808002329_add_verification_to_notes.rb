class AddVerificationToNotes < ActiveRecord::Migration
  def change
  
  	add_column :notes, :verified, :string

  end
end
