class AddPrecisionToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :precision, :integer
  end
end
