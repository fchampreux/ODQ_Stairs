class RemoveBusinessProcessFromBusinessObject < ActiveRecord::Migration
  def change
	remove_column :business_objects, :business_process_id, :integer 
	add_column :business_objects, :business_area_id, :integer 
  end
end
