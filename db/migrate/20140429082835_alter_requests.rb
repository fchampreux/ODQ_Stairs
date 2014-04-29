class AlterRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :type_id, :integer
    add_column :requests, :requests_type_id, :integer
  end
end
