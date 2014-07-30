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

ActiveRecord::Schema.define(version: 20140609154605) do

  create_table "breaches", force: true do |t|
    t.integer  "playground_id",      precision: 38, scale: 0
    t.integer  "business_rule_id",   precision: 38, scale: 0
    t.integer  "application_id",     precision: 38, scale: 0
    t.text     "pk_values"
    t.integer  "business_object_id", precision: 38, scale: 0
    t.integer  "record_id",          precision: 38, scale: 0
    t.integer  "period_id",          precision: 38, scale: 0
    t.integer  "organisation_id",    precision: 38, scale: 0
    t.integer  "territory_id",       precision: 38, scale: 0
    t.string   "name"
    t.text     "description"
    t.integer  "breach_type_id",     precision: 38, scale: 0
    t.integer  "breach_status_id",   precision: 38, scale: 0
    t.string   "message_source"
    t.string   "object_name"
    t.text     "error_message"
    t.text     "current_values"
    t.text     "proposed_values"
    t.boolean  "is_whitelisted",     precision: 1,  scale: 0
    t.datetime "opened_at"
    t.datetime "expected_at"
    t.datetime "closed_at"
    t.integer  "responsible_id",     precision: 38, scale: 0
    t.integer  "approver_id",        precision: 38, scale: 0
    t.datetime "approved_at"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "record_updated_by"
    t.datetime "record_updated_at"
    t.integer  "owner_id",           precision: 38, scale: 0
    t.boolean  "is_identified",      precision: 1,  scale: 0
  end

  create_table "business_areas", force: true do |t|
    t.integer  "playground_id", precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "PCF_index"
    t.string   "PCF_reference"
    t.integer  "status_id",     precision: 38, scale: 0
    t.integer  "owner_id",      precision: 38, scale: 0
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "all_records",   precision: 38, scale: 0
    t.integer  "bad_records",   precision: 38, scale: 0
    t.integer  "score",         precision: 38, scale: 0
  end

  add_index "business_areas", ["code"], name: "index_business_areas_on_code", unique: true
  add_index "business_areas", ["name"], name: "index_business_areas_on_name", unique: true

  create_table "business_flows", force: true do |t|
    t.integer  "playground_id",    precision: 38, scale: 0
    t.integer  "business_area_id", precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "PCF_index"
    t.string   "PCF_reference"
    t.integer  "status_id",        precision: 38, scale: 0
    t.integer  "owner_id",         precision: 38, scale: 0
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "all_records",      precision: 38, scale: 0
    t.integer  "bad_records",      precision: 38, scale: 0
    t.integer  "score",            precision: 38, scale: 0
  end

  create_table "business_objects", force: true do |t|
    t.integer  "playground_id",      precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "organisation_level", precision: 38, scale: 0
    t.integer  "territory_level",    precision: 38, scale: 0
    t.string   "hierarchy"
    t.integer  "status_id",          precision: 38, scale: 0
    t.integer  "owner_id",           precision: 38, scale: 0
    t.string   "db_technology"
    t.string   "db_connection"
    t.string   "db_owner_schema"
    t.string   "structure_name"
    t.text     "key_columns"
    t.text     "published_columns"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "business_area_id",   precision: 38, scale: 0
    t.integer  "all_records",        precision: 38, scale: 0
    t.integer  "bad_records",        precision: 38, scale: 0
    t.integer  "score",              precision: 38, scale: 0
  end

  create_table "business_processes", force: true do |t|
    t.integer  "playground_id",    precision: 38, scale: 0
    t.integer  "business_flow_id", precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "PCF_index"
    t.string   "PCF_reference"
    t.integer  "status_id",        precision: 38, scale: 0
    t.integer  "owner_id",         precision: 38, scale: 0
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "all_records",      precision: 38, scale: 0
    t.integer  "bad_records",      precision: 38, scale: 0
    t.integer  "score",            precision: 38, scale: 0
  end

  create_table "business_rules", force: true do |t|
    t.integer  "playground_id",        precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.text     "business_value"
    t.string   "hierarchy"
    t.integer  "status_id",            precision: 38, scale: 0
    t.integer  "owner_id",             precision: 38, scale: 0
    t.text     "check_description"
    t.text     "check_script"
    t.text     "correction_method"
    t.text     "correction_script"
    t.string   "correction_batch"
    t.text     "white_list"
    t.text     "condition"
    t.integer  "added_value",          precision: 38, scale: 0
    t.integer  "maintenance_cost",     precision: 38, scale: 0
    t.integer  "maintenance_duration", precision: 38, scale: 0
    t.string   "version"
    t.integer  "approver_id",          precision: 38, scale: 0
    t.datetime "approved_at"
    t.integer  "business_process_id",  precision: 38, scale: 0
    t.integer  "business_object_id",   precision: 38, scale: 0
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "rule_type_id",         precision: 38, scale: 0
    t.integer  "severity_id",          precision: 38, scale: 0
    t.integer  "complexity_id",        precision: 38, scale: 0
    t.integer  "all_records",          precision: 38, scale: 0
    t.integer  "bad_records",          precision: 38, scale: 0
    t.integer  "score",                precision: 38, scale: 0
  end

  create_table "data_policies", force: true do |t|
    t.integer  "playground_id",       precision: 38, scale: 0
    t.integer  "landscape_id",        precision: 38, scale: 0
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
    t.integer  "scope_id",            precision: 38, scale: 0
    t.integer  "business_process_id", precision: 38, scale: 0
    t.integer  "approver_id",         precision: 38, scale: 0
    t.datetime "approved_at"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "landscapes", force: true do |t|
    t.integer  "playground_id", precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "status_id",     precision: 38, scale: 0
    t.integer  "owner_id",      precision: 38, scale: 0
    t.integer  "all_records",   precision: 38, scale: 0
    t.integer  "bad_records",   precision: 38, scale: 0
    t.integer  "score",         precision: 38, scale: 0
  end

  create_table "mappings", force: true do |t|
    t.integer  "playground_id",    precision: 38, scale: 0
    t.integer  "mappings_list_id", precision: 38, scale: 0
    t.string   "source_software"
    t.string   "source_table"
    t.string   "source_value_id"
    t.string   "source_code"
    t.string   "target_software"
    t.string   "target_table"
    t.string   "target_value_id"
    t.string   "target_code"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_caption"
    t.string   "target_caption"
    t.integer  "owner_id",         precision: 38, scale: 0
  end

  create_table "mappings_lists", force: true do |t|
    t.integer  "playground_id",  precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "owner_id",       precision: 38, scale: 0
    t.integer  "source_list_id", precision: 38, scale: 0
    t.integer  "target_list_id", precision: 38, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organisations", force: true do |t|
    t.integer  "playground_id",      precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "organisation_level", precision: 38, scale: 0
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "status_id",          precision: 38, scale: 0
    t.integer  "owner_id",           precision: 38, scale: 0
    t.integer  "parent_id",          precision: 38, scale: 0
  end

  create_table "parameters", force: true do |t|
    t.integer  "playground_id",      precision: 38, scale: 0
    t.string   "name"
    t.text     "description"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parent_list"
    t.string   "param_value"
    t.integer  "parameters_list_id", precision: 38, scale: 0
    t.string   "param_code"
  end

  add_index "parameters", ["name"], name: "index_parameters_on_name"

  create_table "parameters_lists", force: true do |t|
    t.integer  "playground_id",    precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "owner_id",         precision: 38, scale: 0
    t.boolean  "is_user_specific", precision: 1,  scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playgrounds", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "status_id",   precision: 38, scale: 0
    t.integer  "owner_id",    precision: 38, scale: 0
    t.integer  "all_records", precision: 38, scale: 0
    t.integer  "bad_records", precision: 38, scale: 0
    t.integer  "score",       precision: 38, scale: 0
  end

  create_table "roles", force: true do |t|
    t.integer  "playground_id", precision: 38, scale: 0
    t.integer  "code",          precision: 38, scale: 0
    t.string   "role"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "scopes", force: true do |t|
    t.integer  "playground_id",       precision: 38, scale: 0
    t.integer  "landscape_id",        precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.text     "SQL_query"
    t.string   "load_interface"
    t.integer  "organisation_level",  precision: 38, scale: 0
    t.integer  "territory_level",     precision: 38, scale: 0
    t.integer  "business_object_id",  precision: 38, scale: 0
    t.integer  "business_process_id", precision: 38, scale: 0
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "status_id",           precision: 38, scale: 0
    t.integer  "owner_id",            precision: 38, scale: 0
    t.integer  "all_records",         precision: 38, scale: 0
    t.integer  "bad_records",         precision: 38, scale: 0
    t.integer  "score",               precision: 38, scale: 0
  end

  create_table "territories", force: true do |t|
    t.integer  "playground_id",   precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "territory_level", precision: 38, scale: 0
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "status_id",       precision: 38, scale: 0
    t.integer  "owner_id",        precision: 38, scale: 0
    t.integer  "parent_id",       precision: 38, scale: 0
  end

  create_table "time_scales", force: true do |t|
    t.integer  "playground_id",   precision: 38, scale: 0
    t.integer  "day_number",      precision: 38, scale: 0
    t.integer  "day_of_week",     precision: 38, scale: 0
    t.integer  "day_of_month",    precision: 38, scale: 0
    t.integer  "day_of_year",     precision: 38, scale: 0
    t.integer  "week_number",     precision: 38, scale: 0
    t.integer  "week_of_month",   precision: 38, scale: 0
    t.integer  "week_of_year",    precision: 38, scale: 0
    t.integer  "month_number",    precision: 38, scale: 0
    t.integer  "month_of_year",   precision: 38, scale: 0
    t.integer  "quarter_number",  precision: 38, scale: 0
    t.integer  "quarter",         precision: 38, scale: 0
    t.integer  "semester_number", precision: 38, scale: 0
    t.integer  "semester",        precision: 38, scale: 0
    t.integer  "year_number",     precision: 38, scale: 0
    t.integer  "year",            precision: 38, scale: 0
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "user_accesses", force: true do |t|
    t.integer  "playground_id",       precision: 38, scale: 0
    t.integer  "user_id",             precision: 38, scale: 0
    t.integer  "organisation_id",     precision: 38, scale: 0
    t.integer  "territory_id",        precision: 38, scale: 0
    t.integer  "business_area_id",    precision: 38, scale: 0
    t.integer  "business_flow_id",    precision: 38, scale: 0
    t.integer  "business_process_id", precision: 38, scale: 0
    t.integer  "business_object_id",  precision: 38, scale: 0
    t.text     "description"
    t.integer  "organisation_level",  precision: 38, scale: 0
    t.integer  "territory_level",     precision: 38, scale: 0
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "user_roles", force: true do |t|
    t.integer  "playground_id", precision: 38, scale: 0
    t.integer  "user_id",       precision: 38, scale: 0
    t.string   "role_id"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "users", force: true do |t|
    t.integer  "playground_id",         precision: 38, scale: 0
    t.integer  "default_playground_id", precision: 38, scale: 0
    t.integer  "current_playground_id", precision: 38, scale: 0
    t.integer  "current_landscape_id",  precision: 38, scale: 0
    t.string   "directory_id"
    t.string   "login"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.datetime "active_from"
    t.datetime "active_to"
    t.boolean  "is_admin",              precision: 1,  scale: 0
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["login"], name: "index_users_on_login", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "values", force: true do |t|
    t.integer  "playground_id",  precision: 38, scale: 0
    t.integer  "values_list_id", precision: 38, scale: 0
    t.string   "name"
    t.text     "description"
    t.string   "value_code"
    t.string   "value_caption"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "values_lists", force: true do |t|
    t.integer  "playground_id", precision: 38, scale: 0
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "owner_id",      precision: 38, scale: 0
    t.string   "table_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id",   precision: 38, scale: 0
    t.string   "software_name"
  end

end
