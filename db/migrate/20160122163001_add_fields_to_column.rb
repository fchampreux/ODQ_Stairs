class AddFieldsToColumn < ActiveRecord::Migration
  def change
    change_table("columns") do |t| 
      t.boolean :is_published
      t.string :code, limit: 30
    end
  end
end
