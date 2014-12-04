class AddOrganisationsExtRef < ActiveRecord::Migration
  def change
    add_column :organisations, :external_reference, :string
    add_column :territories, :external_reference, :string
  end
end
