# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  title              :string(100)      not null
#  description        :text
#  severity_id        :integer          not null
#  status_id          :integer          not null
#  scope_id           :integer          not null
#  business_object_id :integer          not null
#  expected_at        :datetime
#  closed_at          :datetime
#  responsible_id     :integer          not null
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'spec_helper'

describe Notification do
  pending "add some examples to (or delete) #{__FILE__}"
end
