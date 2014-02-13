class CreateParametersLists < ActiveRecord::Migration
  def change
    create_table :parameters_lists do |t|
      t.integer :playground_id
      t.string :code
      t.string :name
      t.text :description
      t.string :created_by
      t.string :updated_by
      t.integer :owner_id
      t.boolean :is_user_specific

      t.timestamps
    end
  end
end
