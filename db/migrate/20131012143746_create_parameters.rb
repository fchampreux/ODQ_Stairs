class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.integer :playground_id
      t.boolean :is_list
      t.integer :parent_list_id
      t.string :code
      t.string :name
      t.text :description
      t.integer :parameter_index
      t.string :parameter_caption
      t.datetime :active_from
      t.datetime :active_to
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
