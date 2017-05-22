class UserLoginChange < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :login, :string
    add_column :users, :user_name, :string
    add_column :users, :language_id, :integer
  end
end
