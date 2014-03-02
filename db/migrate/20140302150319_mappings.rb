class Mappings < ActiveRecord::Migration
  def change
    create_table :mappings_lists do |t|
      t.integer :playground_id
      t.string :code
      t.string :name
      t.text :description
      t.string :created_by
      t.string :updated_by
      t.integer :owner_id
      t.integer :source_list_id
      t.integer :target_list_id

      t.timestamps
    end

    create_table :mappings do |t|
      t.integer :playground_id
      t.integer :mappings_list_id
      t.string :source_software
      t.string :source_table
      t.string :source_value_id
      t.string :source_code
      t.string :source_catpion
      t.string :target_software
      t.string :target_table
      t.string :target_value_id
      t.string :target_code
      t.string :target_catpion
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
