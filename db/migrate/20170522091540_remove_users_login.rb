class RemoveUsersLogin < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :login, :string
    add_column :users, :user_name, :string, limit: 30
    add_index :users, :user_name,  unique: true 
    add_index :users, :email,  unique: true 
  end
end
