class AddPaymentToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :payment_method, :string, :default => "PayPal"
  end
end
