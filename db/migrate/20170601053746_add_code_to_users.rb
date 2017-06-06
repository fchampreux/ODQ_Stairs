class AddCodeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :code, :string, limit: 10
    add_column :groups, :code, :string, limit: 10
  end
end
