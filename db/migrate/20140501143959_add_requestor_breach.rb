class AddRequestorBreach < ActiveRecord::Migration
  def change
    remove_column :breaches, :assigned_to, :integer
    remove_column :breaches, :requested_by, :integer
    add_column :breaches, :responsible_id, :integer
    add_column :breaches, :requestor_id, :integer
    add_column :breaches, :approver_id, :integer
    add_column :breaches, :approved_at, :datetime
  end
end
