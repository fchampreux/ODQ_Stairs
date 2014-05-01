class UpdateRequests < ActiveRecord::Migration
  def change
    create_table :update_requests do |t|
      t.integer  :playground_id
      t.string   :name
      t.text     :description
      t.text     :current_values
      t.text     :proposed_values
      t.integer  :business_rule_id
      t.integer  :record_id
      t.integer  :organisation_id
      t.integer  :territory_id
      t.integer  :status_id
      t.integer  :type_id
      t.boolean  :is_whitelisted
      t.integer  :requested_by_id
      t.integer  :requested_to_id
      t.date     :opened_at
      t.date     :expected_at
      t.date     :closed_at
      t.string   :created_by
      t.string   :updated_by

      t.timestamps
    end
  end
end