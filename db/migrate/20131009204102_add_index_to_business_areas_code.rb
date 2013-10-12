class AddIndexToBusinessAreasCode < ActiveRecord::Migration
  def change
    add_index :business_areas, :code, unique: true
    add_index :business_areas, :name, unique: true
    add_index :business_areas, :hierarchy, unique: true
  end
end
