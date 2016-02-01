class ModifScope < ActiveRecord::Migration
  def change
    remove_column :scopes, :description, :text
    add_column :scopes, :description, :text    , limit: 4000
    remove_column :scopes, :SQL_query, :text
    add_column :scopes, :sql_query, :text    , limit: 4000    
  end
end
