class AddStatusToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :status_id, :integer
    add_column :organisations, :owner_id, :integer
    add_column :territories, :status_id, :integer
    add_column :territories, :owner_id, :integer
  end
end
