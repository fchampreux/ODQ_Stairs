
class DimTime < ActiveRecord::Base
### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

end


