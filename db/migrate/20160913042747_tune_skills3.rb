class TuneSkills3 < ActiveRecord::Migration[5.0]
  def change
      remove_column :skills, :skill_type, :string    
      remove_column :skills, :created_by, :string    
      remove_column :skills, :updated_by, :string    
      remove_column :skills, :session_id, :string
  end
end
