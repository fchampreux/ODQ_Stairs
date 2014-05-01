class Records < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.timestamps
    end
    add_column :records, :playground_id, :integer 
    add_column :records, :business_object_id, :integer 
    add_column :records, :organisation_id, :integer 
    add_column :records, :territory_id, :integer
    add_column :records, :scope_number, :numeric
    add_column :records, :rule_number, :numeric
    add_column :records, :error_number, :numeric 
    add_column :records, :whitelist_number, :numeric 
    add_column :records, :period_id, :integer
    add_column :records, :pk_values, :string 
    add_column :records, :record_created_by, :string
    add_column :records, :record_created_at, :timestamp
    add_column :records, :record_updated_by, :string
    add_column :records, :record_updated_at, :timestamp    
    add_column :records, :first_time_right, :timestamp 
    add_column :records, :first_user_right, :string 
    add_column :records, :last_time_wrong, :timestamp
    add_column :records, :last_user_wrong, :string
    add_column :records, :data_values, :string 
    add_column :records, :updated_values, :string 
    add_column :records, :observation, :text
    add_column :records, :editor_id, :integer 
    add_column :records, :edited_at, :timestamp
    add_column :records, :approver_id, :integer 
    add_column :records, :approved_at, :timestamp
    add_column :records, :corrector_id, :integer 
    add_column :records, :corrected_at, :timestamp
    add_column :records, :record_status, :string  
    add_column :records, :created_by, :string
    add_column :records, :updated_by, :string
    add_column :records, :process_id, :integer
  end
end
