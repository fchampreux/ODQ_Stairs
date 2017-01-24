# == Schema Information
#
# Table name: odq_dwh.dm_measures
#
#  id                   :integer          not null, primary key
#  playground_id        :integer
#  odq_object_id        :integer          not null
#  odq_parent_id        :integer
#  odq_object_name      :string(255)
#  odq_object_code      :string(255)
#  odq_object_url       :string(255)
#  is_project_hierarchy :boolean
#  period_id            :integer          not null
#  period_day           :string(8)
#  all_records          :integer
#  error_count          :integer
#  score                :decimal(5, 2)
#  workload             :decimal(10, 2)
#  added_value          :decimal(10, 2)
#  maintenance_cost     :decimal(10, 2)
#  created_by           :string(255)
#  updated_by           :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  process_id           :integer
#

class DmMeasure < ActiveRecord::Base
  self.table_name = "odq_dwh.dm_measures"
  
### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

end


