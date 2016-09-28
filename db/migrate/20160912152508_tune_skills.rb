class TuneSkills < ActiveRecord::Migration[5.0]
  def change
      remove_column :skills, :skill_size, :string
      add_column :skills, :skill_size, :integer
      remove_column :skills, :skill_precision, :string
      add_column :skills, :skill_precision, :integer
      remove_column :skills, :skill_type_id, :string
      add_column :skills, :skill_type_id, :integer    
      remove_column :skills, :skill_type, :string
      add_column :skills, :skill_type, :string,limit: 20
      remove_column :skills, :skill_type_id, :string
      add_column :skills, :skill_type_id, :integer    
      remove_column :skills, :session_id, :string
      add_column :skills, :session_id, :string, limit: 100        
      remove_column :skills, :created_by, :string
      add_column :skills, :created_by, :string  , limit: 100       
      remove_column :skills, :updated_by, :string
      add_column :skills, :updated_by, :string   , limit: 100             
  end
end
