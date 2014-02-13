class AddParametersParentListId < ActiveRecord::Migration
  def change
    add_column :parameters, :parameters_list_id, :integer
    add_column :parameters, :param_code, :string
    remove_column :parameters, :is_list, :boolean
    remove_column :parameters, :code, :string
  end
end
