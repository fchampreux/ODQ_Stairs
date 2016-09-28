class TuneSkills2 < ActiveRecord::Migration[5.0]
  def change
      remove_column :skills, :is_key, :boolean
      add_column :skills, :is_key, :boolean
      remove_column :skills, :is_published, :boolean
      add_column :skills, :is_published, :boolean
  end
end
