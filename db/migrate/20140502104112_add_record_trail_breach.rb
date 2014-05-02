class AddRecordTrailBreach < ActiveRecord::Migration
  def change
    add_column :breaches, :record_updated_by, :string
    add_column :breaches, :record_updated_at, :datetime
  end
end
