class AddPkvaluesBreaches < ActiveRecord::Migration
  def change
    add_column :breaches, :pk_values, :text
    add_column :breaches, :business_object_id, :integer
  end
end
