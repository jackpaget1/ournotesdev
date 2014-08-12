class ChangeOrderNumberInNotifications < ActiveRecord::Migration
  def change
  	remove_column :payment_notifications, :cart_id
  	add_column :payment_notifications, :cart_id, :string
  end
end
