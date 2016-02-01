class ModifBoAndScopes < ActiveRecord::Migration
  def change
    remove_column :business_objects,   :code,             :string
    remove_column :business_objects,   :db_technology,    :string
    remove_column :business_objects,   :db_connection,    :string
    remove_column :business_objects,   :db_owner_schema,  :string
    remove_column :business_objects,   :structure_name,   :string
    remove_column :business_objects,   :key_columns,      :text
    remove_column :business_objects,   :published_columns,:text
    add_column :business_objects,   :main_scope_id, :integer
    add_column :scopes,   :db_technology,    :string, limit: 30
    add_column :scopes,   :db_connection,    :string, limit: 200
    add_column :scopes,   :db_owner_schema,  :string, limit: 30
    add_column :scopes,   :structure_name,   :string, limit: 50
    remove_column :scopes, :business_process_id, :integer
  end
end
