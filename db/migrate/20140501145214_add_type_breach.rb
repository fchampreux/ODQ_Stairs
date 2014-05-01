class AddTypeBreach < ActiveRecord::Migration
  def change
    add_column :breaches, :breach_type_id, :integer
  end
end
