class CreateGlobalSequence < ActiveRecord::Migration
  def change
    execute "CREATE SEQUENCE global_seq INCREMENT BY 1 START WITH 1000"
  end
end
