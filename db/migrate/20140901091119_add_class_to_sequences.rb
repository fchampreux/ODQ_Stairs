class AddClassToSequences < ActiveRecord::Migration
  def change
    remove_column :sequences, :value, :integer
    remove_column :sequences, :sequence, :string
    add_column :sequences, :class_name, :string
    add_column :sequences, :current_id, :integer
  end
end
