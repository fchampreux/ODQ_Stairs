class ValuesList < ActiveRecord::Migration
  def change
    create_table :values_lists do |t|
      t.integer :playground_id
      t.string :code
      t.string :name
      t.text :description
      t.string :created_by
      t.string :updated_by
      t.integer :owner_id
      t.integer :application_id
      t.string :application_name
      t.string :table_name

      t.timestamps
    end

    create_table :values do |t|
      t.integer :playground_id
      t.integer :values_list_id
      t.string :name
      t.text :description
      t.string :value_code
      t.string :value_caption
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
