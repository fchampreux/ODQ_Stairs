class AddCodeToParameters < ActiveRecord::Migration
  def change
    add_column :parameters, :code, :string
  end
end
