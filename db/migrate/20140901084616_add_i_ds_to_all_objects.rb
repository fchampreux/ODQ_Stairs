class AddIDsToAllObjects < ActiveRecord::Migration
  def change
    add_column :playgrounds, :odq_unique_id, :integer
    add_column :playgrounds, :odq_object_id, :integer
    add_column :landscapes, :odq_unique_id, :integer
    add_column :landscapes, :odq_object_id, :integer
    add_column :scopes, :odq_unique_id, :integer
    add_column :scopes, :odq_object_id, :integer
    add_column :business_areas, :odq_unique_id, :integer
    add_column :business_areas, :odq_object_id, :integer
    add_column :business_flows, :odq_unique_id, :integer
    add_column :business_flows, :odq_object_id, :integer
    add_column :business_processes, :odq_unique_id, :integer
    add_column :business_processes, :odq_object_id, :integer
    add_column :business_rules, :odq_unique_id, :integer
    add_column :business_rules, :odq_object_id, :integer
    add_column :breaches, :odq_unique_id, :integer
    add_column :breaches, :odq_object_id, :integer
    add_column :business_objects, :odq_unique_id, :integer
    add_column :business_objects, :odq_object_id, :integer
    add_column :organisations, :odq_unique_id, :integer
    add_column :organisations, :odq_object_id, :integer
    add_column :territories, :odq_unique_id, :integer
    add_column :territories, :odq_object_id, :integer
  end
end
