class AddRuleTypeIdToBusinessRules < ActiveRecord::Migration
  def change
	remove_column :business_rules, :rule_type, :string
	add_column :business_rules, :rule_type_id, :integer
  end
end
