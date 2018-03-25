# == Schema Information
#
# Table name: groups
#
#  id              :integer          not null, primary key
#  code            :string(60)       not null
#  name            :string(100)      not null
#  description     :string
#  territory_id    :integer          not null
#  organisation_id :integer          not null
#  owner_id        :integer          not null
#  created_by      :string(100)      not null
#  updated_by      :string(100)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Group, type: :model do
    it { should respond_to(:owner_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:organisation_id) }
    it { should respond_to(:territory_id) }
    it { should respond_to(:created_by) }
    it { should respond_to(:updated_by) }
end
