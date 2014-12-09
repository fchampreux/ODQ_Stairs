class AddNotificationToBreaches < ActiveRecord::Migration
  def change
    add_column :breaches, :notification_id, :integer
  end
end
