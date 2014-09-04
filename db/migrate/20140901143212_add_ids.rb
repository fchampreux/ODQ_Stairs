class AddIds < ActiveRecord::Migration
  def change
    add_column :mappings, :odq_unique_id, :integer
    add_column :mappings, :odq_object_id, :integer
    add_column :mappings_lists, :odq_unique_id, :integer
    add_column :mappings_lists, :odq_object_id, :integer
    add_column :parameters, :odq_unique_id, :integer
    add_column :parameters, :odq_object_id, :integer
    add_column :parameters_lists, :odq_unique_id, :integer
    add_column :parameters_lists, :odq_object_id, :integer
    add_column :values, :odq_unique_id, :integer
    add_column :values, :odq_object_id, :integer
    add_column :values_lists, :odq_unique_id, :integer
    add_column :values_lists, :odq_object_id, :integer
  end
end
