# == Schema Information
#
# Table name: odq_facts
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  playground_id      :integer
#  business_object_id :integer
#  organisation_id    :integer
#  territory_id       :integer
#  scope_number       :decimal(, )
#  rule_number        :decimal(, )
#  error_number       :decimal(, )
#  whitelist_number   :decimal(, )
#  period_id          :integer
#  pk_values          :string(255)
#  record_created_by  :string(255)
#  record_created_at  :datetime
#  record_updated_by  :string(255)
#  record_updated_at  :datetime
#  first_time_right   :datetime
#  first_user_right   :string(255)
#  last_time_wrong    :datetime
#  last_user_wrong    :string(255)
#  data_values        :string(255)
#  updated_values     :string(255)
#  observation        :text
#  editor_id          :integer
#  edited_at          :datetime
#  approver_id        :integer
#  approved_at        :datetime
#  corrector_id       :integer
#  corrected_at       :datetime
#  record_status      :string(255)
#  created_by         :string(255)
#  updated_by         :string(255)
#  process_id         :integer
#




class OdqFact < ActiveRecord::Base

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter

### validation
  belongs_to :business_rules

### private functions definitions
  private


end


