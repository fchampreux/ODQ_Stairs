


class OdqFacts < ActiveRecord::Base

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter

### validation
  belongs_to :business_rules

### private functions definitions
  private


end


