class OdqFacts < ActiveRecord::Migration
  def change
    create_table :odq_facts do |t|
      t.timestamps
    end
    add_column :odq_facts, :playground_id, :integer 
    add_column :odq_facts, :business_object_id, :integer 
    add_column :odq_facts, :organisation_id, :integer 
    add_column :odq_facts, :territory_id, :integer
    add_column :odq_facts, :scope_number, :numeric
    add_column :odq_facts, :rule_number, :numeric
    add_column :odq_facts, :error_number, :numeric 
    add_column :odq_facts, :whitelist_number, :numeric 
    add_column :odq_facts, :period_id, :integer
    add_column :odq_facts, :pk_values, :string 
    add_column :odq_facts, :record_created_by, :string
    add_column :odq_facts, :record_created_at, :timestamp
    add_column :odq_facts, :record_updated_by, :string
    add_column :odq_facts, :record_updated_at, :timestamp    
    add_column :odq_facts, :first_time_right, :timestamp 
    add_column :odq_facts, :first_user_right, :string 
    add_column :odq_facts, :last_time_wrong, :timestamp
    add_column :odq_facts, :last_user_wrong, :string
    add_column :odq_facts, :data_values, :string 
    add_column :odq_facts, :updated_values, :string 
    add_column :odq_facts, :observation, :text
    add_column :odq_facts, :editor_id, :integer 
    add_column :odq_facts, :edited_at, :timestamp
    add_column :odq_facts, :approver_id, :integer 
    add_column :odq_facts, :approved_at, :timestamp
    add_column :odq_facts, :corrector_id, :integer 
    add_column :odq_facts, :corrected_at, :timestamp
    add_column :odq_facts, :record_status, :string  
    add_column :odq_facts, :created_by, :string
    add_column :odq_facts, :updated_by, :string
    add_column :odq_facts, :process_id, :integer
  end
end
