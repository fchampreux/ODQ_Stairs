class AlterProjectHierarchy < ActiveRecord::Migration
  def change
    add_column :playgrounds, :status_id, :integer
    add_column :playgrounds, :owner_id, :integer
    add_column :landscapes, :status_id, :integer
    add_column :landscapes, :owner_id, :integer
    add_column :scopes, :status_id, :integer
    add_column :scopes, :owner_id, :integer
  end
end
