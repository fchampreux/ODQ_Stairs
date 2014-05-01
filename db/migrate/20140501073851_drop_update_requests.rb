class DropUpdateRequests < ActiveRecord::Migration
  def change
    drop_table :update_requests
  end
end
