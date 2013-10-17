class Parameter < ActiveRecord::Base
  before_save do
    self.code = parent_list.gsub(/[^0-9A-Za-z]/, '_').upcase
  end
end
