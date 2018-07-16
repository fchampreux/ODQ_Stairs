# == Schema Information
#
# Table name: odq_dwh.dm_processes
#
#  playground_id    :integer          not null
#  odq_object_id    :integer          not null
#  odq_parent_id    :integer          not null
#  odq_object_name  :string(100)
#  odq_object_code  :string(100)
#  odq_object_url   :string(100)
#  period_id        :integer          not null
#  period_day       :string(8)
#  organisation_id  :integer          not null
#  territory_id     :integer          not null
#  all_records      :integer          default(0)
#  error_count      :integer          default(0)
#  score            :decimal(5, 2)    default(0.0)
#  workload         :decimal(12, 2)   default(0.0)
#  added_value      :decimal(12, 2)   default(0.0)
#  maintenance_cost :decimal(12, 2)   default(0.0)
#  created_by       :string(100)      not null
#  updated_by       :string(100)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class DmProcess < ActiveRecord::Base
  self.table_name = "odq_dwh.dm_processes"
  
### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

end


