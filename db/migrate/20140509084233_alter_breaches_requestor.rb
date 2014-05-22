class AlterBreachesRequestor < ActiveRecord::Migration
  def change
    add_column :breaches, :owner_id, :integer
    remove_column :breaches, :requestor_id, :integer
  end
end
