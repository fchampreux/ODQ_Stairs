class RemoveUsersColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password_digest, :string
    remove_column :users, :remember_token, :string
    add_column :users, :language_id, :integer
  end
end
