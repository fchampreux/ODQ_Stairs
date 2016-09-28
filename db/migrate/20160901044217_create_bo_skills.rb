class CreateBoSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string   :name,                 limit: 100,                 null: false
      t.text     :description
      t.string   :type,                 limit: 20,                  null: false
      t.integer  :size,                                             null: false
      t.integer  :precision,            default: 0
      t.string   :pattern
      t.boolean  :is_key,               default: false,             null: false
      t.boolean  :is_published,         default: false,             null: false
      t.string   :created_by,           limit: 100,                 null: false
      t.string   :updated_by,           limit: 100,                 null: false
      t.string   :session_id,           limit: 100,                 null: false

      t.timestamps null: false

    end
  end
end
