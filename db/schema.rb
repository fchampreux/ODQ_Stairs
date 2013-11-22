# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131121225539) do

  create_table "business_areas", force: true do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "PCF_index"
    t.string   "PCF_reference"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "business_areas", ["code"], name: "index_business_areas_on_code", unique: true
  add_index "business_areas", ["hierarchy"], name: "index_business_areas_on_hierarchy", unique: true
  add_index "business_areas", ["name"], name: "index_business_areas_on_name", unique: true

  create_table "business_flows", force: true do |t|
    t.integer  "playground_id"
    t.integer  "business_area_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "PCF_index"
    t.string   "PCF_reference"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "business_objects", force: true do |t|
    t.integer  "playground_id"
    t.string   "business_process_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "organisation_level"
    t.integer  "territory_level"
    t.string   "hierarchy"
    t.string   "PCF_index"
    t.string   "PCF_reference"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.string   "db_technology"
    t.string   "db_connection"
    t.string   "db_owner_schema"
    t.string   "structure_name"
    t.text     "key_columns"
    t.text     "published_columns"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "business_processes", force: true do |t|
    t.integer  "playground_id"
    t.integer  "business_flow_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "PCF_index"
    t.string   "PCF_reference"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "business_rules", force: true do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.text     "business_value"
    t.string   "hierarchy"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.text     "check_description"
    t.text     "check_script"
    t.text     "correction_method"
    t.text     "correction_script"
    t.string   "correction_batch"
    t.text     "white_list"
    t.text     "condition"
    t.decimal  "complexity"
    t.decimal  "added_value"
    t.decimal  "severity"
    t.decimal  "maintenance_cost"
    t.decimal  "maintenance_duration"
    t.string   "version"
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.integer  "business_process_id"
    t.integer  "business_object_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "rule_type_id"
  end

  create_table "data_policies", force: true do |t|
    t.integer  "playground_id"
    t.integer  "landscape_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.text     "organisations_list"
    t.text     "territories_list"
    t.text     "business_rules_list"
    t.text     "date_limitations"
    t.text     "policy_matrix"
    t.string   "status_id"
    t.string   "owner_id"
    t.datetime "active_from"
    t.datetime "active_to"
    t.integer  "scope_id"
    t.integer  "business_process_id"
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "landscapes", force: true do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "status_id"
    t.integer  "owner_id"
  end

  create_table "organisations", force: true do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "parent_organisation_id"
    t.integer  "organisation_level"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "parameters", force: true do |t|
    t.integer  "playground_id"
    t.boolean  "is_list"
    t.string   "name"
    t.text     "description"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parent_list"
    t.string   "code"
  end

  add_index "parameters", ["name"], name: "index_parameters_on_name"

  create_table "playgrounds", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status_id"
    t.integer  "owner_id"
  end

  create_table "roles", force: true do |t|
    t.integer  "playground_id"
    t.integer  "code"
    t.string   "role"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "scopes", force: true do |t|
    t.integer  "playground_id"
    t.integer  "landscape_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.text     "SQL_query"
    t.string   "load_interface"
    t.integer  "organisation_level"
    t.integer  "territory_level"
    t.integer  "business_object_id"
    t.integer  "business_process_id"
    t.text     "impacted_business_rules"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status_id"
    t.integer  "owner_id"
  end

  create_table "territories", force: true do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "parent_territory_id"
    t.integer  "territory_level"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "time_scales", force: true do |t|
    t.integer  "playground_id"
    t.integer  "day_number"
    t.integer  "day_of_week"
    t.integer  "day_of_month"
    t.integer  "day_of_year"
    t.integer  "week_number"
    t.integer  "week_of_month"
    t.integer  "week_of_year"
    t.integer  "month_number"
    t.integer  "month_of_year"
    t.integer  "quarter_number"
    t.integer  "quarter"
    t.integer  "semester_number"
    t.integer  "semester"
    t.integer  "year_number"
    t.integer  "year"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_accesses", force: true do |t|
    t.integer  "playground_id"
    t.integer  "user_id"
    t.integer  "organisation_id"
    t.integer  "territory_id"
    t.integer  "business_area_id"
    t.integer  "business_flow_id"
    t.integer  "business_process_id"
    t.integer  "business_object_id"
    t.text     "description"
    t.integer  "organisation_level"
    t.integer  "territory_level"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "user_roles", force: true do |t|
    t.integer  "playground_id"
    t.integer  "user_id"
    t.string   "role_id"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: true do |t|
    t.integer  "playground_id"
    t.integer  "default_playground_id"
    t.integer  "current_playground_id"
    t.integer  "current_landscape_id"
    t.string   "directory_id"
    t.string   "login"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.datetime "active_from"
    t.datetime "active_to"
    t.boolean  "is_admin"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["login"], name: "index_users_on_login", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
