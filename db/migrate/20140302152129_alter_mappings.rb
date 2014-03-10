class AlterMappings < ActiveRecord::Migration
  def change
    remove_column :mappings, :source_catpion, :string
    remove_column :mappings, :target_catpion, :string
    add_column :mappings, :source_caption, :string
    add_column :mappings, :target_caption, :string
  end
end
