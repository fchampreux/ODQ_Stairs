# == Schema Information
#
# Table name: odq_dwh.dim_time
#
#  period_id         :integer          not null, primary key
#  playground_id     :integer
#  period            :string(6)
#  period_day        :string(8)
#  period_date       :date
#  period_timestamp  :datetime
#  day_of_month      :integer
#  day_of_year       :integer
#  day_number        :integer
#  week_of_month     :integer
#  week_of_year      :integer
#  week_number       :integer
#  month             :integer
#  month_name        :string(20)
#  month_number      :integer
#  trimester_of_year :integer
#  trimester_number  :integer
#  semester_of_year  :integer
#  semester_number   :integer
#  year              :integer
#  year_number       :integer
#  created_by        :string(255)
#  updated_by        :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  process_id        :integer
#

class DimTime < ActiveRecord::Base
  self.table_name = "odq_dwh.dim_time"
### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

end


