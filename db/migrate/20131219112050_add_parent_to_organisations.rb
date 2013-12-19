class AddParentToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :parent_id, :integer
    remove_column :organisations, :parent_organisation_id, :integer
    add_column :territories, :parent_id, :integer
    remove_column :territories, :parent_territory_id, :integer
  end
end
