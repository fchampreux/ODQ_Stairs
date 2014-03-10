class AddOwnerMappings < ActiveRecord::Migration
  def change
    add_column :mappings, :owner_id, :integer
  end
end
