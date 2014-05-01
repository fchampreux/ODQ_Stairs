class AddAssigneeBreach < ActiveRecord::Migration
  def change
    remove_column :breaches, :requested_to_id, :integer
    remove_column :breaches, :requested_by_id, :integer
    add_column :breaches, :assigned_to, :integer
    add_column :breaches, :requested_by, :integer
  end
end
