class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string   :name,                 limit: 100,                 null: false
      t.text     :description
      t.string   :type,                 limit: 20,                  null: false
      t.integer  :size,                                             null: false
      t.boolean  :is_key,               default: false,             null: false
      t.string   :created_by,           limit: 100,                 null: false
      t.string   :updated_by,           limit: 100,                 null: false
      t.string   :session_id,           limit: 100,                 null: false

      t.timestamps null: false
    end
  end
end
