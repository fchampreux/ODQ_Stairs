class AlterTableColumns < ActiveRecord::Migration
  def change
    add_column :columns, :column_type, :string, limit: 20
  end
end
