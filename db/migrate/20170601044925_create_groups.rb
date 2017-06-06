class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :role
      t.integer :territory_id
      t.integer :organisation_id
      t.string :created_by
      t.string :updated_by
      t.date :active_from
      t.date :active_to

      t.timestamps
    end
  end
end
