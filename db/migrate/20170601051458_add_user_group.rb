class AddUserGroup < ActiveRecord::Migration[5.1]
  def change
    create_table :group_users do |t|
    t.integer :group_id
    t.integer :user_id
    t.boolean :is_group_admin
    t.integer :priority
    t.date :active_from
    t.date :active_to
    t.string :created_by
    t.string :update_by
    end
  end
end
