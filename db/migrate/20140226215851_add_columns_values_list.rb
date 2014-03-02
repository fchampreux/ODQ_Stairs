class AddColumnsValuesList < ActiveRecord::Migration
  def change
    add_column :values_lists, :software_id, :integer
    add_column :values_lists, :software_name, :string
    remove_column :values_lists, :application_id, :integer
    remove_column :values_lists, :application_name, :string
  end
end
