class AddSeverityToBusinessRules < ActiveRecord::Migration
  def change
    add_column :business_rules, :severity_id, :integer
    add_column :business_rules, :complexity_id, :integer
  end
end
