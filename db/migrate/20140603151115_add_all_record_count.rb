class AddAllRecordCount < ActiveRecord::Migration
  def change
    add_column :business_rules, :all_records, :integer
    add_column :business_rules, :bad_records, :integer
    add_column :business_processes, :all_records, :integer
    add_column :business_processes, :bad_records, :integer
    add_column :business_flows, :all_records, :integer
    add_column :business_flows, :bad_records, :integer
    add_column :business_areas, :all_records, :integer
    add_column :business_areas, :bad_records, :integer
    add_column :business_objects, :all_records, :integer
    add_column :business_objects, :bad_records, :integer
    add_column :playgrounds, :all_records, :integer
    add_column :playgrounds, :bad_records, :integer
    add_column :landscapes, :all_records, :integer
    add_column :landscapes, :bad_records, :integer
    add_column :scopes, :all_records, :integer
    add_column :scopes, :bad_records, :integer
  end
end
