class AddObservationBreach < ActiveRecord::Migration
  def change
    add_column :breaches, :observation, :text
    add_column :breaches, :error_message, :text
  end
end
