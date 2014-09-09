class AddOwnerIdToParameters < ActiveRecord::Migration
  def change
    add_column :parameters, :owner_id, :integer 
  end
end
