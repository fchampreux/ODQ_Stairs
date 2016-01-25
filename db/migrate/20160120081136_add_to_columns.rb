class AddToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :business_object_id, :integer
    add_column :columns, :playground_id, :integer
    
  end
end
