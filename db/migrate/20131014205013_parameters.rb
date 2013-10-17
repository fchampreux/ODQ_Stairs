class Parameters < ActiveRecord::Migration
  def change
	remove_column :parameters, :code, :string
  end
end
