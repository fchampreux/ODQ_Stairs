class AlterBreachIsIdentified < ActiveRecord::Migration
  def change
    add_column :breaches, :is_identified, :boolean
    remove_column :breaches, :observation, :text
  end
end
