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

ActiveRecord::Schema.define(version: 20150921192946) do

  create_table "breaches", force: :cascade do |t|
    t.integer  "playground_id",      limit: 4
    t.integer  "business_rule_id",   limit: 4
    t.integer  "application_id",     limit: 4
    t.text     "pk_values",          limit: 2147483647
    t.integer  "business_object_id", limit: 4
    t.integer  "record_id",          limit: 4
    t.integer  "period_id",          limit: 4
    t.integer  "organisation_id",    limit: 4
    t.integer  "territory_id",       limit: 4
    t.string   "name",               limit: 4000
    t.text     "description",        limit: 2147483647
    t.integer  "breach_type_id",     limit: 4
    t.integer  "breach_status_id",   limit: 4
    t.string   "message_source",     limit: 4000
    t.string   "object_name",        limit: 4000
    t.text     "error_message",      limit: 2147483647
    t.text     "current_values",     limit: 2147483647
    t.text     "proposed_values",    limit: 2147483647
    t.boolean  "is_whitelisted"
    t.date     "opened_at"
    t.date     "expected_at"
    t.date     "closed_at"
    t.integer  "responsible_id",     limit: 4
    t.integer  "approver_id",        limit: 4
    t.datetime "approved_at"
    t.string   "created_by",         limit: 4000
    t.string   "updated_by",         limit: 4000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "record_updated_by",  limit: 4000
    t.datetime "record_updated_at"
    t.integer  "owner_id",           limit: 4
    t.boolean  "is_identified"
    t.integer  "odq_unique_id",      limit: 4
    t.integer  "odq_object_id",      limit: 4
    t.integer  "notification_id",    limit: 4
  end

  create_table "business_areas", force: :cascade do |t|
    t.integer  "playground_id", limit: 4
    t.string   "code",          limit: 4000
    t.string   "name",          limit: 4000
    t.text     "description",   limit: 2147483647
    t.string   "hierarchy",     limit: 4000
    t.string   "pcf_index",     limit: 4000
    t.string   "pcf_reference", limit: 4000
    t.integer  "status_id",     limit: 4
    t.integer  "owner_id",      limit: 4
    t.string   "created_by",    limit: 4000
    t.string   "updated_by",    limit: 4000
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "all_records",   limit: 4
    t.integer  "bad_records",   limit: 4
    t.decimal  "score",                            precision: 18, scale: 0
    t.integer  "odq_unique_id", limit: 4
    t.integer  "odq_object_id", limit: 4
  end

  add_index "business_areas", ["code"], name: "index_business_areas_on_code", unique: true
  add_index "business_areas", ["name"], name: "index_business_areas_on_name", unique: true

  create_table "business_flows", force: :cascade do |t|
    t.integer  "playground_id",    limit: 4
    t.integer  "business_area_id", limit: 4
    t.string   "code",             limit: 4000
    t.string   "name",             limit: 4000
    t.text     "description",      limit: 2147483647
    t.string   "hierarchy",        limit: 4000
    t.string   "pcf_index",        limit: 4000
    t.string   "pcf_reference",    limit: 4000
    t.integer  "status_id",        limit: 4
    t.integer  "owner_id",         limit: 4
    t.string   "created_by",       limit: 4000
    t.string   "updated_by",       limit: 4000
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "all_records",      limit: 4
    t.integer  "bad_records",      limit: 4
    t.decimal  "score",                               precision: 18, scale: 0
    t.integer  "odq_unique_id",    limit: 4
    t.integer  "odq_object_id",    limit: 4
  end

  create_table "business_objects", force: :cascade do |t|
    t.integer  "playground_id",      limit: 4
    t.string   "code",               limit: 4000
    t.string   "name",               limit: 4000
    t.text     "description",        limit: 2147483647
    t.integer  "organisation_level", limit: 4
    t.integer  "territory_level",    limit: 4
    t.string   "hierarchy",          limit: 4000
    t.integer  "status_id",          limit: 4
    t.integer  "owner_id",           limit: 4
    t.string   "db_technology",      limit: 4000
    t.string   "db_connection",      limit: 4000
    t.string   "db_owner_schema",    limit: 4000
    t.string   "structure_name",     limit: 4000
    t.text     "key_columns",        limit: 2147483647
    t.text     "published_columns",  limit: 2147483647
    t.string   "created_by",         limit: 4000
    t.string   "updated_by",         limit: 4000
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "business_area_id",   limit: 4
    t.integer  "all_records",        limit: 4
    t.integer  "bad_records",        limit: 4
    t.decimal  "score",                                 precision: 18, scale: 0
    t.integer  "odq_unique_id",      limit: 4
    t.integer  "odq_object_id",      limit: 4
  end

  create_table "business_processes", force: :cascade do |t|
    t.integer  "playground_id",    limit: 4
    t.integer  "business_flow_id", limit: 4
    t.string   "code",             limit: 4000
    t.string   "name",             limit: 4000
    t.text     "description",      limit: 2147483647
    t.string   "hierarchy",        limit: 4000
    t.string   "pcf_index",        limit: 4000
    t.string   "pcf_reference",    limit: 4000
    t.integer  "status_id",        limit: 4
    t.integer  "owner_id",         limit: 4
    t.string   "created_by",       limit: 4000
    t.string   "updated_by",       limit: 4000
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "all_records",      limit: 4
    t.integer  "bad_records",      limit: 4
    t.decimal  "score",                               precision: 18, scale: 0
    t.integer  "odq_unique_id",    limit: 4
    t.integer  "odq_object_id",    limit: 4
  end

  create_table "business_rules", force: :cascade do |t|
    t.integer  "playground_id",        limit: 4
    t.string   "code",                 limit: 4000
    t.string   "name",                 limit: 4000
    t.text     "description",          limit: 2147483647
    t.text     "business_value",       limit: 2147483647
    t.string   "hierarchy",            limit: 4000
    t.integer  "status_id",            limit: 4
    t.integer  "owner_id",             limit: 4
    t.text     "check_description",    limit: 2147483647
    t.text     "check_script",         limit: 2147483647
    t.text     "correction_method",    limit: 2147483647
    t.text     "correction_script",    limit: 2147483647
    t.string   "correction_batch",     limit: 4000
    t.text     "white_list",           limit: 2147483647
    t.text     "condition",            limit: 2147483647
    t.decimal  "added_value",                             precision: 18, scale: 0
    t.decimal  "maintenance_cost",                        precision: 18, scale: 0
    t.decimal  "maintenance_duration",                    precision: 18, scale: 0
    t.string   "version",              limit: 4000
    t.integer  "approver_id",          limit: 4
    t.datetime "approved_at"
    t.integer  "business_process_id",  limit: 4
    t.integer  "business_object_id",   limit: 4
    t.string   "created_by",           limit: 4000
    t.string   "updated_by",           limit: 4000
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.integer  "rule_type_id",         limit: 4
    t.integer  "severity_id",          limit: 4
    t.integer  "complexity_id",        limit: 4
    t.integer  "all_records",          limit: 4
    t.integer  "bad_records",          limit: 4
    t.decimal  "score",                                   precision: 18, scale: 0
    t.integer  "odq_unique_id",        limit: 4
    t.integer  "odq_object_id",        limit: 4
  end

  create_table "data_policies", force: :cascade do |t|
    t.integer  "playground_id",       limit: 4
    t.integer  "landscape_id",        limit: 4
    t.string   "code",                limit: 4000
    t.string   "name",                limit: 4000
    t.text     "description",         limit: 2147483647
    t.text     "organisations_list",  limit: 2147483647
    t.text     "territories_list",    limit: 2147483647
    t.text     "business_rules_list", limit: 2147483647
    t.text     "date_limitations",    limit: 2147483647
    t.text     "policy_matrix",       limit: 2147483647
    t.string   "status_id",           limit: 4000
    t.string   "owner_id",            limit: 4000
    t.datetime "active_from"
    t.datetime "active_to"
    t.integer  "scope_id",            limit: 4
    t.integer  "business_process_id", limit: 4
    t.integer  "approver_id",         limit: 4
    t.datetime "approved_at"
    t.string   "created_by",          limit: 4000
    t.string   "updated_by",          limit: 4000
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "data_processes", force: :cascade do |t|
    t.integer  "playground_id",      limit: 4
    t.string   "name",               limit: 4000
    t.text     "description",        limit: 2147483647
    t.integer  "scope_id",           limit: 4
    t.integer  "business_object_id", limit: 4
    t.integer  "status_id",          limit: 4
    t.datetime "last_run_at"
    t.datetime "next_run_at"
    t.datetime "last_run_end"
    t.decimal  "duration",                              precision: 18, scale: 0
    t.integer  "loaded",             limit: 4
    t.integer  "inserted",           limit: 4
    t.integer  "updated",            limit: 4
    t.integer  "deleted",            limit: 4
    t.integer  "rejected",           limit: 4
    t.integer  "owner_id",           limit: 4
    t.integer  "odq_unique_id",      limit: 4
    t.integer  "odq_object_id",      limit: 4
    t.string   "created_by",         limit: 4000
    t.string   "updated_by",         limit: 4000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "landscapes", force: :cascade do |t|
    t.integer  "playground_id", limit: 4
    t.string   "code",          limit: 4000
    t.string   "name",          limit: 4000
    t.text     "description",   limit: 2147483647
    t.string   "hierarchy",     limit: 4000
    t.string   "created_by",    limit: 4000
    t.string   "updated_by",    limit: 4000
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "status_id",     limit: 4
    t.integer  "owner_id",      limit: 4
    t.integer  "all_records",   limit: 4
    t.integer  "bad_records",   limit: 4
    t.decimal  "score",                            precision: 18, scale: 0
    t.integer  "odq_unique_id", limit: 4
    t.integer  "odq_object_id", limit: 4
  end

  create_table "mappings", force: :cascade do |t|
    t.integer  "playground_id",    limit: 4
    t.integer  "mappings_list_id", limit: 4
    t.string   "source_software",  limit: 4000
    t.string   "source_table",     limit: 4000
    t.string   "source_value_id",  limit: 4000
    t.string   "source_code",      limit: 4000
    t.string   "target_software",  limit: 4000
    t.string   "target_table",     limit: 4000
    t.string   "target_value_id",  limit: 4000
    t.string   "target_code",      limit: 4000
    t.string   "created_by",       limit: 4000
    t.string   "updated_by",       limit: 4000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_caption",   limit: 4000
    t.string   "target_caption",   limit: 4000
    t.integer  "owner_id",         limit: 4
    t.integer  "odq_unique_id",    limit: 4
    t.integer  "odq_object_id",    limit: 4
  end

  create_table "mappings_lists", force: :cascade do |t|
    t.integer  "playground_id",  limit: 4
    t.string   "code",           limit: 4000
    t.string   "name",           limit: 4000
    t.text     "description",    limit: 2147483647
    t.string   "created_by",     limit: 4000
    t.string   "updated_by",     limit: 4000
    t.integer  "owner_id",       limit: 4
    t.integer  "source_list_id", limit: 4
    t.integer  "target_list_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "odq_unique_id",  limit: 4
    t.integer  "odq_object_id",  limit: 4
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "playground_id",      limit: 4
    t.string   "name",               limit: 4000
    t.text     "description",        limit: 2147483647
    t.integer  "severity_id",        limit: 4
    t.integer  "status_id",          limit: 4
    t.integer  "scope_id",           limit: 4
    t.integer  "business_object_id", limit: 4
    t.datetime "expected_at"
    t.datetime "closed_at"
    t.integer  "responsible_id",     limit: 4
    t.integer  "owner_id",           limit: 4
    t.string   "created_by",         limit: 4000
    t.string   "updated_by",         limit: 4000
    t.integer  "odq_unique_id",      limit: 4
    t.integer  "odq_object_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organisations", force: :cascade do |t|
    t.integer  "playground_id",      limit: 4
    t.string   "code",               limit: 4000
    t.string   "name",               limit: 4000
    t.text     "description",        limit: 2147483647
    t.integer  "organisation_level", limit: 4
    t.string   "hierarchy",          limit: 4000
    t.string   "created_by",         limit: 4000
    t.string   "updated_by",         limit: 4000
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "status_id",          limit: 4
    t.integer  "owner_id",           limit: 4
    t.integer  "parent_id",          limit: 4
    t.integer  "odq_unique_id",      limit: 4
    t.integer  "odq_object_id",      limit: 4
    t.string   "external_reference", limit: 4000
  end

  create_table "parameters", force: :cascade do |t|
    t.integer  "playground_id",      limit: 4
    t.string   "name",               limit: 4000
    t.text     "description",        limit: 2147483647
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by",         limit: 4000
    t.string   "updated_by",         limit: 4000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parent_list",        limit: 4000
    t.string   "param_value",        limit: 4000
    t.integer  "parameters_list_id", limit: 4
    t.string   "param_code",         limit: 4000
    t.integer  "odq_unique_id",      limit: 4
    t.integer  "odq_object_id",      limit: 4
    t.integer  "owner_id",           limit: 4
  end

  add_index "parameters", ["name"], name: "index_parameters_on_name"

  create_table "parameters_lists", force: :cascade do |t|
    t.integer  "playground_id",    limit: 4
    t.string   "code",             limit: 4000
    t.string   "name",             limit: 4000
    t.text     "description",      limit: 2147483647
    t.string   "created_by",       limit: 4000
    t.string   "updated_by",       limit: 4000
    t.integer  "owner_id",         limit: 4
    t.boolean  "is_user_specific"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "odq_unique_id",    limit: 4
    t.integer  "odq_object_id",    limit: 4
  end

  create_table "playgrounds", force: :cascade do |t|
    t.string   "code",          limit: 4000
    t.string   "name",          limit: 4000
    t.text     "description",   limit: 2147483647
    t.string   "hierarchy",     limit: 4000
    t.string   "created_by",    limit: 4000
    t.string   "updated_by",    limit: 4000
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "status_id",     limit: 4
    t.integer  "owner_id",      limit: 4
    t.integer  "all_records",   limit: 4
    t.integer  "bad_records",   limit: 4
    t.decimal  "score",                            precision: 18, scale: 0
    t.integer  "odq_unique_id", limit: 4
    t.integer  "odq_object_id", limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "playground_id", limit: 4
    t.integer  "code",          limit: 4
    t.string   "role",          limit: 4000
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by",    limit: 4000
    t.string   "updated_by",    limit: 4000
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "scopes", force: :cascade do |t|
    t.integer  "playground_id",       limit: 4
    t.integer  "landscape_id",        limit: 4
    t.string   "code",                limit: 4000
    t.string   "name",                limit: 4000
    t.text     "description",         limit: 2147483647
    t.text     "SQL_query",           limit: 2147483647
    t.string   "load_interface",      limit: 4000
    t.integer  "organisation_level",  limit: 4
    t.integer  "territory_level",     limit: 4
    t.integer  "business_object_id",  limit: 4
    t.integer  "business_process_id", limit: 4
    t.string   "hierarchy",           limit: 4000
    t.string   "created_by",          limit: 4000
    t.string   "updated_by",          limit: 4000
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.integer  "status_id",           limit: 4
    t.integer  "owner_id",            limit: 4
    t.integer  "all_records",         limit: 4
    t.integer  "bad_records",         limit: 4
    t.decimal  "score",                                  precision: 18, scale: 0
    t.integer  "odq_unique_id",       limit: 4
    t.integer  "odq_object_id",       limit: 4
  end

  create_table "sequences", force: :cascade do |t|
    t.integer "playground_id", limit: 4
    t.string  "class_name",    limit: 4000
    t.integer "current_id",    limit: 4
  end

  create_table "territories", force: :cascade do |t|
    t.integer  "playground_id",      limit: 4
    t.string   "code",               limit: 4000
    t.string   "name",               limit: 4000
    t.text     "description",        limit: 2147483647
    t.integer  "territory_level",    limit: 4
    t.string   "hierarchy",          limit: 4000
    t.string   "created_by",         limit: 4000
    t.string   "updated_by",         limit: 4000
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "status_id",          limit: 4
    t.integer  "owner_id",           limit: 4
    t.integer  "parent_id",          limit: 4
    t.integer  "odq_unique_id",      limit: 4
    t.integer  "odq_object_id",      limit: 4
    t.string   "external_reference", limit: 4000
  end

  create_table "time_scales", force: :cascade do |t|
    t.integer  "playground_id",   limit: 4
    t.integer  "day_number",      limit: 4
    t.integer  "day_of_week",     limit: 4
    t.integer  "day_of_month",    limit: 4
    t.integer  "day_of_year",     limit: 4
    t.integer  "week_number",     limit: 4
    t.integer  "week_of_month",   limit: 4
    t.integer  "week_of_year",    limit: 4
    t.integer  "month_number",    limit: 4
    t.integer  "month_of_year",   limit: 4
    t.integer  "quarter_number",  limit: 4
    t.integer  "quarter",         limit: 4
    t.integer  "semester_number", limit: 4
    t.integer  "semester",        limit: 4
    t.integer  "year_number",     limit: 4
    t.integer  "year",            limit: 4
    t.string   "created_by",      limit: 4000
    t.string   "updated_by",      limit: 4000
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "user_accesses", force: :cascade do |t|
    t.integer  "playground_id",       limit: 4
    t.integer  "user_id",             limit: 4
    t.integer  "organisation_id",     limit: 4
    t.integer  "territory_id",        limit: 4
    t.integer  "business_area_id",    limit: 4
    t.integer  "business_flow_id",    limit: 4
    t.integer  "business_process_id", limit: 4
    t.integer  "business_object_id",  limit: 4
    t.text     "description",         limit: 2147483647
    t.integer  "organisation_level",  limit: 4
    t.integer  "territory_level",     limit: 4
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by",          limit: 4000
    t.string   "updated_by",          limit: 4000
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "playground_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.string   "role_id",       limit: 4000
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by",    limit: 4000
    t.string   "updated_by",    limit: 4000
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "playground_id",         limit: 4
    t.integer  "default_playground_id", limit: 4
    t.integer  "current_playground_id", limit: 4
    t.integer  "current_landscape_id",  limit: 4
    t.string   "directory_id",          limit: 4000
    t.string   "login",                 limit: 4000
    t.string   "email",                 limit: 4000
    t.string   "first_name",            limit: 4000
    t.string   "last_name",             limit: 4000
    t.text     "description",           limit: 2147483647
    t.datetime "active_from"
    t.datetime "active_to"
    t.boolean  "is_admin"
    t.string   "password_digest",       limit: 4000
    t.string   "remember_token",        limit: 4000
    t.string   "created_by",            limit: 4000
    t.string   "updated_by",            limit: 4000
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "name",                  limit: 4000
    t.string   "language",              limit: 4000
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["login"], name: "index_users_on_login", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "values", force: :cascade do |t|
    t.integer  "playground_id",  limit: 4
    t.integer  "values_list_id", limit: 4
    t.string   "name",           limit: 4000
    t.text     "description",    limit: 2147483647
    t.string   "value_code",     limit: 4000
    t.string   "value_caption",  limit: 4000
    t.string   "created_by",     limit: 4000
    t.string   "updated_by",     limit: 4000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "odq_unique_id",  limit: 4
    t.integer  "odq_object_id",  limit: 4
  end

  create_table "values_lists", force: :cascade do |t|
    t.integer  "playground_id", limit: 4
    t.string   "code",          limit: 4000
    t.string   "name",          limit: 4000
    t.text     "description",   limit: 2147483647
    t.string   "created_by",    limit: 4000
    t.string   "updated_by",    limit: 4000
    t.integer  "owner_id",      limit: 4
    t.string   "table_name",    limit: 4000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id",   limit: 4
    t.string   "software_name", limit: 4000
    t.integer  "odq_unique_id", limit: 4
    t.integer  "odq_object_id", limit: 4
  end

end
