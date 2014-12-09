class CreateDataProcesses < ActiveRecord::Migration
  def change
    create_table :data_processes do |t|
      t.integer :playground_id
      t.string :name
      t.text :description
      t.integer :scope_id
      t.integer :business_object_id
      t.integer :status_id
      t.datetime :last_run_at
      t.datetime :next_run_at
      t.datetime :last_run_end
      t.decimal :duration
      t.integer :loaded
      t.integer :inserted
      t.integer :updated
      t.integer :deleted
      t.integer :rejected
      t.integer :owner_id
      t.integer :odq_unique_id
      t.integer :odq_object_id
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
