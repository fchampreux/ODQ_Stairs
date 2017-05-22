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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170520060735) do
=======
ActiveRecord::Schema.define(version: 20170522091540) do
>>>>>>> devise_users

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breaches", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "business_rule_id"
    t.integer  "application_id"
    t.text     "pk_values"
    t.integer  "business_object_id"
    t.integer  "record_id"
    t.integer  "period_id"
    t.integer  "organisation_id"
    t.integer  "territory_id"
    t.string   "name",               limit: 255
    t.text     "description"
    t.integer  "breach_type_id"
    t.integer  "breach_status_id"
    t.string   "message_source",     limit: 255
    t.string   "object_name",        limit: 255
    t.text     "error_message"
    t.text     "current_values"
    t.text     "proposed_values"
    t.boolean  "is_whitelisted"
    t.datetime "opened_at"
    t.datetime "expected_at"
    t.datetime "closed_at"
    t.integer  "responsible_id"
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.string   "record_updated_by",  limit: 255
    t.datetime "record_updated_at"
    t.integer  "owner_id"
    t.boolean  "is_identified"
    t.integer  "notification_id"
    t.string   "created_by",         limit: 255
    t.string   "updated_by",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "business_areas", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code",          limit: 255
    t.string   "name",          limit: 255
    t.text     "description"
    t.string   "hierarchy",     limit: 255
    t.string   "pcf_index",     limit: 255
    t.string   "pcf_reference", limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.integer  "score"
    t.string   "created_by",    limit: 255
    t.string   "updated_by",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "business_flows", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "business_area_id"
    t.string   "code",             limit: 255
    t.string   "name",             limit: 255
    t.text     "description"
    t.string   "hierarchy",        limit: 255
    t.string   "pcf_index",        limit: 255
    t.string   "pcf_reference",    limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.integer  "score"
    t.string   "created_by",       limit: 255
    t.string   "updated_by",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "business_objects", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "business_area_id"
    t.integer  "main_scope_id"
    t.string   "code",               limit: 255
    t.string   "name",               limit: 255
    t.text     "description"
    t.integer  "organisation_level"
    t.integer  "territory_level"
    t.string   "hierarchy",          limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.integer  "score"
    t.string   "created_by",         limit: 255
    t.string   "updated_by",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "business_processes", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "business_flow_id"
    t.string   "code",             limit: 255
    t.string   "name",             limit: 255
    t.text     "description"
    t.string   "hierarchy",        limit: 255
    t.string   "pcf_index",        limit: 255
    t.string   "pcf_reference",    limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.integer  "score"
    t.string   "created_by",       limit: 255
    t.string   "updated_by",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "business_rules", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "business_process_id"
    t.integer  "business_object_id"
    t.string   "code",                 limit: 255
    t.string   "name",                 limit: 255
    t.text     "description"
    t.text     "business_value"
    t.string   "hierarchy",            limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.text     "check_description"
    t.text     "check_script"
    t.text     "correction_method"
    t.text     "correction_script"
    t.string   "correction_batch",     limit: 255
    t.text     "white_list"
    t.text     "condition"
    t.integer  "added_value"
    t.integer  "maintenance_cost"
    t.integer  "maintenance_duration"
    t.string   "version",              limit: 255
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.integer  "rule_type_id"
    t.integer  "severity_id"
    t.integer  "complexity_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.integer  "score"
    t.string   "created_by",           limit: 255
    t.string   "updated_by",           limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "dim_time", primary_key: "period_id", id: :integer, force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "period",            limit: 6
    t.string   "period_day",        limit: 8
    t.date     "period_date"
    t.datetime "period_timestamp"
    t.integer  "day_of_month"
    t.integer  "day_of_year"
    t.integer  "day_number"
    t.integer  "week_of_month"
    t.integer  "week_of_year"
    t.integer  "week_number"
    t.integer  "month"
    t.string   "month_name",        limit: 20
    t.integer  "month_number"
    t.integer  "trimester_of_year"
    t.integer  "trimester_number"
    t.integer  "semester_of_year"
    t.integer  "semester_number"
    t.integer  "year"
    t.integer  "year_number"
    t.string   "created_by",        limit: 255
    t.string   "updated_by",        limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "process_id"
  end

  create_table "dm_measures", id: :integer, default: -> { "nextval('dm_business_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "odq_object_id",                                             null: false
    t.integer  "odq_parent_id"
    t.string   "odq_object_name",      limit: 255
    t.string   "odq_object_code",      limit: 255
    t.string   "odq_object_url",       limit: 255
    t.boolean  "is_project_hierarchy"
    t.integer  "period_id",                                                 null: false
    t.string   "period_day",           limit: 8
    t.integer  "all_records"
    t.integer  "error_count"
    t.decimal  "score",                            precision: 5,  scale: 2
    t.decimal  "workload",                         precision: 15, scale: 2
    t.decimal  "added_value",                      precision: 15, scale: 2
    t.decimal  "maintenance_cost",                 precision: 15, scale: 2
    t.string   "created_by",           limit: 255
    t.string   "updated_by",           limit: 255
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "process_id"
    t.index ["odq_object_id", "period_id"], name: "dm_measures_akey", unique: true, using: :btree
    t.index ["odq_parent_id", "period_id"], name: "dm_measures_ak1", using: :btree
  end

  create_table "landscapes", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code",          limit: 255
    t.string   "name",          limit: 255
    t.text     "description"
    t.string   "hierarchy",     limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.integer  "score"
    t.string   "created_by",    limit: 255
    t.string   "updated_by",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "mappings", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "mappings_list_id"
    t.string   "source_software",  limit: 255
    t.string   "source_table",     limit: 255
    t.string   "source_value_id",  limit: 255
    t.string   "source_code",      limit: 255
    t.string   "target_software",  limit: 255
    t.string   "target_table",     limit: 255
    t.string   "target_value_id",  limit: 255
    t.string   "target_code",      limit: 255
    t.string   "created_by",       limit: 255
    t.string   "updated_by",       limit: 255
    t.string   "source_caption",   limit: 255
    t.string   "target_caption",   limit: 255
    t.integer  "owner_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "mappings_lists", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code",           limit: 255
    t.string   "name",           limit: 255
    t.text     "description"
    t.string   "created_by",     limit: 255
    t.string   "updated_by",     limit: 255
    t.integer  "owner_id"
    t.integer  "source_list_id"
    t.integer  "target_list_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "name",               limit: 255
    t.text     "description"
    t.integer  "severity_id"
    t.integer  "status_id"
    t.integer  "scope_id"
    t.integer  "business_object_id"
    t.datetime "expected_at"
    t.datetime "closed_at"
    t.integer  "responsible_id"
    t.integer  "owner_id"
    t.string   "created_by",         limit: 255
    t.string   "updated_by",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "organisations", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code",               limit: 255
    t.string   "name",               limit: 255
    t.text     "description"
    t.integer  "organisation_level"
    t.string   "hierarchy",          limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "parent_id"
    t.string   "external_reference", limit: 255
    t.string   "created_by",         limit: 255
    t.string   "updated_by",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "parameters", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "name",               limit: 255
    t.text     "description"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "parent_list",        limit: 255
    t.string   "param_value",        limit: 255
    t.integer  "parameters_list_id"
    t.string   "param_code",         limit: 255
    t.integer  "owner_id"
    t.string   "created_by",         limit: 255
    t.string   "updated_by",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "parameters_lists", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code",             limit: 255
    t.string   "name",             limit: 255
    t.text     "description"
    t.integer  "owner_id"
    t.boolean  "is_user_specific"
    t.string   "created_by",       limit: 255
    t.string   "updated_by",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "playgrounds", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code",          limit: 255
    t.string   "name",          limit: 255
    t.text     "description"
    t.string   "hierarchy",     limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.integer  "score"
    t.string   "created_by",    limit: 255
    t.string   "updated_by",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "scopes", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "landscape_id"
    t.string   "code",               limit: 255
    t.string   "name",               limit: 255
    t.string   "load_interface",     limit: 255
    t.integer  "organisation_level"
    t.integer  "territory_level"
    t.integer  "business_object_id"
    t.string   "hierarchy",          limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.integer  "score"
    t.string   "db_technology",      limit: 30
    t.string   "db_connection",      limit: 200
    t.string   "db_owner_schema",    limit: 30
    t.string   "structure_name",     limit: 50
    t.text     "description"
    t.text     "sql_query"
    t.string   "created_by",         limit: 255
    t.string   "updated_by",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",               limit: 100
    t.text     "description"
    t.integer  "business_object_id"
    t.integer  "skill_size"
    t.integer  "skill_precision"
    t.integer  "skill_type_id"
    t.boolean  "is_key"
    t.boolean  "is_published"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "territories", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code",               limit: 255
    t.string   "name",               limit: 255
    t.text     "description"
    t.integer  "territory_level"
    t.string   "hierarchy",          limit: 255
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "parent_id"
    t.string   "external_reference", limit: 255
    t.string   "created_by",         limit: 255
    t.string   "updated_by",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "time_scales", primary_key: "period_id", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "day_of_week"
    t.integer  "day_of_month"
    t.integer  "day_of_year"
    t.integer  "week_of_year"
    t.integer  "month_of_year"
    t.integer  "year"
    t.string   "period_month",     limit: 6
    t.string   "period_day",       limit: 8
    t.date     "period_date"
    t.datetime "period_timestamp"
    t.string   "created_by",       limit: 255
    t.string   "updated_by",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "default_playground_id"
    t.integer  "current_playground_id"
    t.integer  "current_landscape_id"
    t.string   "directory_id",           limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "name",                   limit: 255
    t.string   "language"
    t.text     "description"
    t.datetime "active_from"
    t.datetime "active_to"
    t.boolean  "is_admin"
    t.string   "created_by",             limit: 255
    t.string   "updated_by",             limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                    default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "language_id"
<<<<<<< HEAD
    t.string   "user_name"
=======
    t.string   "user_name",              limit: 30
>>>>>>> devise_users
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree
  end

  create_table "values", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "values_list_id"
    t.string   "name",           limit: 255
    t.text     "description"
    t.string   "code",           limit: 255
    t.string   "caption",        limit: 255
    t.string   "created_by",     limit: 255
    t.string   "updated_by",     limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "values_lists", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code",          limit: 255
    t.string   "name",          limit: 255
    t.text     "description"
    t.integer  "owner_id"
    t.string   "table_name",    limit: 255
    t.integer  "software_id"
    t.string   "software_name", limit: 255
    t.string   "created_by",    limit: 255
    t.string   "updated_by",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
