class AddScoreAll < ActiveRecord::Migration
  def change
    add_column :business_areas, :score, :decimal
    add_column :business_objects, :score, :decimal
    add_column :business_flows, :score, :decimal
    add_column :business_processes, :score, :decimal
    add_column :business_rules, :score, :decimal
    add_column :playgrounds, :score, :decimal
    add_column :landscapes, :score, :decimal
    add_column :scopes, :score, :decimal
  end
end
