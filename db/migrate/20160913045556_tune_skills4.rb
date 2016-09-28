class TuneSkills4 < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills, :skill_pattern, :string
  end
end
