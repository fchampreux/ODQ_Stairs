class AddBoIdToSkill < ActiveRecord::Migration[5.0]
  def change
        add_column :skills, :business_object_id, :integer
  end
end
