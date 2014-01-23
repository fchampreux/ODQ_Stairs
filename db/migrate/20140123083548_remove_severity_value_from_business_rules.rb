class RemoveSeverityValueFromBusinessRules < ActiveRecord::Migration
  def change
    remove_column :business_rules, :severity, :decimal
    remove_column :business_rules, :complexity, :decimal
  end
end
