# == Schema Information
#
# Table name: time_scales
#
#  id              :integer          not null, primary key
#  playground_id   :integer
#  day_number      :integer
#  day_of_week     :integer
#  day_of_month    :integer
#  day_of_year     :integer
#  week_number     :integer
#  week_of_month   :integer
#  week_of_year    :integer
#  month_number    :integer
#  month_of_year   :integer
#  quarter_number  :integer
#  quarter         :integer
#  semester_number :integer
#  semester        :integer
#  year_number     :integer
#  year            :integer
#  created_by      :string(255)
#  updated_by      :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TimeScale < ActiveRecord::Base
end
