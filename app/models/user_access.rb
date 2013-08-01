# == Schema Information
#
# Table name: user_accesses
#
#  id                  :integer          not null, primary key
#  playground_id       :integer
#  user_id             :integer
#  organisation_id     :integer
#  territory_id        :integer
#  business_area_id    :integer
#  business_flow_id    :integer
#  business_process_id :integer
#  business_object_id  :integer
#  description         :text
#  organisation_level  :integer
#  territory_level     :integer
#  active_from         :datetime
#  active_to           :datetime
#  created_by          :string(255)
#  updated_by          :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class UserAccess < ActiveRecord::Base
end
