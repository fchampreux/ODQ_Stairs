# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  severity_id        :integer
#  status_id          :integer
#  scope_id           :integer
#  business_object_id :integer
#  expected_at        :datetime
#  closed_at          :datetime
#  responsible_id     :integer
#  owner_id           :integer
#  created_by         :string(255)
#  updated_by         :string(255)
#  odq_unique_id      :integer
#  odq_object_id      :integer
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Notification do
  pending "add some examples to (or delete) #{__FILE__}"
end