class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.integer :playground_id
      t.string :sequence
      t.integer :value
    end
  end
end
