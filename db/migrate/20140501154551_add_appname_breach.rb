class AddAppnameBreach < ActiveRecord::Migration
  def change
    add_column :breaches, :message_source, :string
    add_column :breaches, :application_id, :integer
    add_column :breaches, :object_name, :string
  end
end
