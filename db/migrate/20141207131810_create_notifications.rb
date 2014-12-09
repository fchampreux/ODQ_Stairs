class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :playground_id
      t.string :name
      t.text :description
      t.integer :severity_id
      t.integer :status_id
      t.integer :scope_id
      t.integer :business_object_id
      t.datetime :expected_at
      t.datetime :closed_at
      t.integer :responsible_id
      t.integer :owner_id
      t.string :created_by
      t.string :updated_by
      t.integer :odq_unique_id
      t.integer :odq_object_id

      t.timestamps
    end
  end
end
