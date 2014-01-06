class RemovePcfFromBusinessObjects < ActiveRecord::Migration
  def change
	remove_column :business_objects, :PCF_index, :string 
	remove_column :business_objects, :PCF_reference, :string 
  end
end
