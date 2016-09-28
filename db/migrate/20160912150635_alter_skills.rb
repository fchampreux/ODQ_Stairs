class AlterSkills < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills, :size, :integer
    remove_column :skills, :pattern, :string
    add_column :skills, :skill_pattern, :string, limit: 100
  end
end
