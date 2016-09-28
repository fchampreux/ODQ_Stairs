class ChangeSkill < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :skill_type, :string
    add_column :skills, :skill_type_id, :string
    add_column :skills, :skill_size, :string
    add_column :skills, :skill_precision, :string
    remove_column :skills, :type, :string
    remove_column :skills, :precision, :integer
    
  end
end
