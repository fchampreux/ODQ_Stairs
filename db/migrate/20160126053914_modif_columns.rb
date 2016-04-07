class ModifColumns < ActiveRecord::Migration
  def change
    add_column :business_objects,   :code,             :string, limit: 255
    remove_column :columns, :code, :string
  end
end
