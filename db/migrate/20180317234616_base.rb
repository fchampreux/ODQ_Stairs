class Base < ActiveRecord::Migration[5.1]
  def change
    create_table "breaches", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "business_rule_id",                  null: false
      t.integer "application_id",                    null: false
      t.text "pk_values",                            null: false
      t.integer "business_object_id",                null: false
      t.integer "record_id",                         null: false
      t.integer "period_id",                         null: false
      t.integer "organisation_id",                   null: false
      t.integer "territory_id",                      null: false
      t.string "title",                  limit: 100
      t.text "description"
      t.integer "breach_type_id",                    null: false
      t.integer "breach_status_id",                  null: false
      t.string "message_source",         limit: 100
      t.string "object_name",            limit: 100
      t.text "error_message"
      t.text "current_values"
      t.text "proposed_values"
      t.boolean "is_whitelisted",                 default: false
      t.datetime "opened_at"
      t.datetime "expected_at"
      t.datetime "closed_at"
      t.integer "responsible_id"
      t.integer "approver_id"
      t.datetime "approved_at"
      t.string "record_updated_by",      limit: 100
      t.datetime "record_updated_at"
      t.integer "owner_id",                          null: false
      t.boolean "is_identified",                  default: false
      t.integer "notification_id"
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
    end
  
    create_table "business_areas", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false
      t.text "description"
      t.string "hierarchy",              limit: 25,  null: false
      t.string "pcf_index",              limit: 30
      t.string "pcf_reference",          limit: 100
      t.integer "status_id",                         null: false
      t.integer "owner_id",                          null: false
      t.integer "all_records",                    default: 0
      t.integer "bad_records",                    default: 0
      t.integer "score",                          default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["playground_id","code"], name: "index_ba_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_ba_on_name", unique: true
      t.index ["hierarchy"], name: "index_ba_on_hierarchy", unique: true
    end
  
    create_table "business_flows", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "business_area_id",                  null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false
      t.text "description"
      t.string "hierarchy",              limit: 25,  null: false
      t.string "pcf_index",              limit: 30
      t.string "pcf_reference",          limit: 100
      t.integer "status_id",                         null: false
      t.integer "owner_id",                          null: false
      t.integer "all_records",                    default: 0
      t.integer "bad_records",                    default: 0
      t.integer "score",                          default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["business_area_id","code"], name: "index_bf_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_bf_on_name", unique: true
      t.index ["hierarchy"], name: "index_bf_on_hierarchy", unique: true
    end
  
    create_table "business_objects", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "business_area_id",                  null: false
      t.integer "main_scope_id"
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false
      t.text "description"
      t.integer "organisation_level"
      t.integer "territory_level"
      t.string "hierarchy",              limit: 25,  null: false
      t.integer "status_id",                         null: false
      t.integer "owner_id",                          null: false
      t.integer "all_records",                    default: 0
      t.integer "bad_records",                    default: 0
      t.integer "score",                          default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["business_area_id","code"], name: "index_bo_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_bo_on_name", unique: true
      t.index ["hierarchy"], name: "index_bo_on_hierarchy", unique: true
    end
  
    create_table "business_processes", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "business_flow_id",                  null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false
      t.text "description"
      t.string "hierarchy",              limit: 25,  null: false
      t.string "pcf_index",              limit: 30
      t.string "pcf_reference",          limit: 100
      t.integer "status_id",                         null: false
      t.integer "owner_id",                          null: false
      t.integer "all_records",                    default: 0
      t.integer "bad_records",                    default: 0
      t.integer "score",                          default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["business_flow_id","code"], name: "index_bp_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_bp_on_name", unique: true
      t.index ["hierarchy"], name: "index_bp_on_hierarchy", unique: true
    end
  
    create_table "business_rules", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "business_process_id",               null: false
      t.integer "business_object_id"
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false
      t.text "description"
      t.text "business_value"
      t.string "hierarchy",              limit: 25,  null: false
      t.text "check_description"
      t.text "check_script"
      t.text "check_language_id",                 default: 0     
      t.text "correction_method"
      t.text "correction_script"
      t.text "correction_language_id",            default: 0
      t.string "correction_batch",       limit: 100
      t.text "white_list"
      t.integer "added_value",                    default: 0
      t.integer "maintenance_cost",               default: 0
      t.integer "maintenance_duration",           default: 0
      t.integer "rule_type_id",                      null: false
      t.integer "severity_id",                       null: false
      t.integer "complexity_id",                     null: false
      t.integer "status_id",                         null: false
      t.integer "owner_id",                          null: false
      t.integer "all_records",                    default: 0
      t.integer "bad_records",                    default: 0
      t.integer "score",                          default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["business_process_id","code"], name: "index_br_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_br_on_name", unique: true
      t.index ["hierarchy"], name: "index_br_on_hierarchy", unique: true
    end
    
    create_table "groups", force: :cascade do |t|
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false
      t.string "description"
      t.integer "territory_id",                      null: false
      t.integer "organisation_id",                   null: false
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["code"], name: "index_groups_on_code", unique: true
      t.index ["name" ], name: "index_groups_on_name", unique: true
    end
  
    create_table "landscapes", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false 
      t.text "description"
      t.string "hierarchy",              limit: 25,  null: false
      t.integer "status_id",                         null: false
      t.integer "all_records",                    default: 0
      t.integer "bad_records",                    default: 0
      t.integer "score",                          default: 0
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["playground_id","code"], name: "index_ls_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_ls_on_name", unique: true
      t.index ["hierarchy"], name: "index_ls_on_hierarchy", unique: true
    end
  
    create_table "mappings", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "mappings_list_id",                  null: false
      t.string "source_software",        limit: 100
      t.string "source_table",           limit: 100
      t.string "source_value_id",        limit: 100
      t.string "source_code",            limit: 100
      t.string "target_software",        limit: 100
      t.string "target_table",           limit: 100
      t.string "target_value_id",        limit: 100
      t.string "target_code",            limit: 100
      t.string "source_property",        limit: 100
      t.string "target_property",        limit: 100
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["mappings_list_id", "source_code", "target_code"], name: "index_map_on_code", unique: true
    end
  
    create_table "mappings_lists", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false 
      t.text "description"
      t.integer "source_list_id",                    null: false
      t.integer "target_list_id",                    null: false
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["playground_id", "code"], name: "index_ml_on_code", unique: true
      t.index ["playground_id", "name"], name: "index_ml_on_name", unique: true
    end
  
    create_table "notifications", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "title",                 limit: 100,  null: false
      t.text "description"
      t.integer "severity_id",                       null: false
      t.integer "status_id",                         null: false
      t.integer "scope_id",                          null: false
      t.integer "business_object_id",                null: false
      t.datetime "expected_at"
      t.datetime "closed_at"
      t.integer "responsible_id",                    null: false
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
    end
  
    create_table "organisations", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false 
      t.text "description"
      t.integer "organisation_level",             default: 0
      t.string "hierarchy",              limit: 25
      t.integer "status_id",                         null: false
      t.integer "parent_id",                         null: false
      t.string "external_reference",     limit: 100
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["parent_id","code"], name: "index_org_on_code", unique: true
      t.index ["hierarchy"], name: "index_org_on_hierarchy", unique: true
      t.index ["playground_id", "name" ], name: "index_org_on_name", unique: true
      t.index ["playground_id", "external_reference"], name: "index_org_on_ext_ref", unique: true
    end
  
    create_table "parameters", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "parameters_list_id",                null: false
      t.string "name",                   limit: 100, null: false
      t.text "description"
      t.datetime "active_from",                      null: false
      t.datetime "active_to",                        null: false
      t.string "parent_list",            limit: 100
      t.string "code",                   limit: 20,  null: false
      t.string "property",               limit: 30,  null: false 
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["playground_id", "name"], name: "index_param_on_name", unique: true
      t.index ["playground_id", "code"], name: "index_param_on_code", unique: true
    end
  
    create_table "parameters_lists", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false 
      t.text "description"         
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["playground_id", "code"], name: "index_pl_on_code", unique: true
      t.index ["playground_id", "name" ], name: "index_pl_on_name", unique: true
    end
  
    create_table "playgrounds", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false 
      t.text "description"
      t.string "hierarchy",              limit: 25
      t.integer "status_id",                         null: false
      t.integer "all_records",                    default: 0
      t.integer "bad_records",                    default: 0
      t.integer "score",                          default: 0
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["code"], name: "index_pg_on_code", unique: true
      t.index ["name" ], name: "index_pg_on_name", unique: true
      t.index ["hierarchy"], name: "index_pg_on_hierarchy", unique: true
    end
  
    create_table "scopes", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "landscape_id",                      null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false 
      t.string "load_interface",         limit: 100
      t.integer "organisation_level"
      t.integer "territory_level"
      t.integer "business_object_id"
      t.string "hierarchy",              limit: 25,  null: false
      t.integer "status_id",                         null: false
      t.integer "all_records",                    default: 0
      t.integer "bad_records",                    default: 0
      t.integer "score",                          default: 0
      t.string "db_technology",          limit: 30
      t.string "db_connection",          limit: 200
      t.string "db_owner_schema",        limit: 30
      t.string "structure_name",         limit: 50
      t.text "description"
      t.text "sql_query"
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["landscape_id","code"], name: "index_sc_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_sc_on_name", unique: true
      t.index ["hierarchy"], name: "index_sc_on_hierarchy", unique: true
    end
  
    create_table "skills", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "name",                   limit: 100, null: false
      t.text "description"
      t.integer "business_object_id",                null: false
      t.integer "skill_size"
      t.integer "skill_precision"
      t.integer "skill_type_id"
      t.boolean "is_key",                         default: false
      t.boolean "is_published",                   default: false
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["business_object_id", "name"], name: "index_skills_on_bo_name", unique: true
    end
  
    create_table "territories", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false 
      t.text "description"
      t.integer "territory_level"
      t.string "hierarchy",              limit: 100
      t.integer "status_id",                         null: false
      t.integer "parent_id",                         null: false
      t.string "external_reference",     limit: 100
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["parent_id","code"], name: "index_ter_on_code", unique: true
      t.index ["hierarchy"], name: "index_ter_on_hierarchy", unique: true
      t.index ["playground_id", "name" ], name: "index_ter_on_name", unique: true
      t.index ["playground_id", "external_reference"], name: "index_ter_on_ext_ref", unique: true
    end
  
    create_table "time_scales", primary_key: "period_id", force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "day_of_week"
      t.integer "day_of_month"
      t.integer "day_of_year"
      t.integer "week_of_year"
      t.integer "month_of_year"
      t.integer "year"
      t.string "period_month",           limit: 6
      t.string "period_day",             limit: 8
      t.date "period_date"
      t.datetime "period_timestamp"
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
    end
  
    create_table "users", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "default_playground_id",          default: 1
      t.integer "current_playground_id",          default: 1
      t.integer "current_landscape_id",           default: 1
      t.string "external_directory_id",  limit: 100
      t.string "first_name",             limit: 100
      t.string "last_name",              limit: 100
      t.string "name",                   limit: 100
      t.string "language"
      t.text "description"
      t.datetime "active_from"
      t.datetime "active_to"
      t.boolean "is_admin",                       default: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.string "email",                 default: "", null: false
      t.string "encrypted_password",    default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count",         default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.inet "current_sign_in_ip"
      t.inet "last_sign_in_ip"
      t.string "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string "unconfirmed_email"
      t.integer "failed_attempts",       default: 0, null: false
      t.string "unlock_token"
      t.datetime "locked_at"
      t.integer "language_id"
      t.string "user_name",              limit: 30, null: false
      t.string "code",                   limit: 10, null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
      t.index ["user_name"], name: "index_users_on_user_name", unique: true
      t.index ["code"], name: "index_users_on_code", unique: true
    end
  
    create_table "values", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "values_list_id",                    null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false 
      t.text "description"
      t.string "property",               limit: 100
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["values_list_id", "code"], name: "index_values_on_code", unique: true
      t.index ["values_list_id", "name"], name: "index_values_on_name", unique: true
    end
  
    create_table "values_lists", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false 
      t.text "description"
      t.string "table_name",             limit: 100
      t.integer "software_id"
      t.string "software_name",          limit: 100
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["playground_id", "code"], name: "index_vl_on_code", unique: true
      t.index ["playground_id", "name" ], name: "index_vl_on_name", unique: true
    end
    
    create_table "activities", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "business_process_id",               null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false
      t.text "description"
      t.string "hierarchy",              limit: 25,  null: false
      t.string "pcf_index",              limit: 30
      t.string "pcf_reference",          limit: 100
      t.integer "status_id",                         null: false
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["business_process_id","code"], name: "index_act_on_code", unique: true
      t.index ["hierarchy"], name: "index_act_on_hierarchy", unique: true
      t.index ["playground_id", "name" ], name: "index_act_on_name", unique: true
    end
    
    create_table "tasks", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "activity_id",                       null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false
      t.text "description"
      t.string "hierarchy",              limit: 25,  null: false
      t.string "pcf_index",              limit: 30
      t.string "pcf_reference",          limit: 100
      t.integer "software_id"
      t.string "external_reference",     limit: 100
      t.integer "status_id",                         null: false
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["activity_id","code"], name: "index_task_on_code", unique: true
      t.index ["hierarchy"], name: "index_task_on_hierarchy", unique: true
      t.index ["playground_id", "name" ], name: "index_task_on_name", unique: true
    end

# temorary table for imports

    create_table :business_hierarchies, id: :serial, force: :cascade do |t|
      t.integer "playground_id"
      t.string "pcf_index"
      t.string "pcf_reference"
      t.integer "hierarchical_level"
      t.string "hierarchy"
      t.string "name"
      t.text "description"
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
      t.index ["hierarchy"], name: "index_BH_on_hierarchy", unique: true
      t.index ["hierarchical_level"], name: "index_BH_on_level"
    end

# Data Marts for analysis

   create_table "odq_dwh.dm_processes", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "odq_object_id",                     null: false
      t.integer "odq_parent_id",                     null: false
      t.string "odq_object_name",        limit: 100
      t.string "odq_object_code",        limit: 100
      t.string "odq_object_url",         limit: 100
      t.integer "period_id",                         null: false
      t.string "period_day",             limit: 8
      t.integer "all_records",                    default: 0
      t.integer "error_count",                    default: 0
      t.decimal "score",            precision: 5, scale: 2, default: 0
      t.decimal "workload",         precision: 5, scale: 2, default: 0
      t.decimal "added_value",      precision: 5, scale: 2, default: 0
      t.decimal "maintenance_cost", precision: 5, scale: 2, default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
    end
   
    create_table "odq_dwh.dm_projects", id: :serial, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.integer "odq_object_id",                     null: false
      t.integer "odq_parent_id",                     null: false
      t.string "odq_object_name",        limit: 100
      t.string "odq_object_code",        limit: 100
      t.string "odq_object_url",         limit: 100
      t.integer "period_id",                         null: false
      t.string "period_day",             limit: 8
      t.integer "all_records",                    default: 0
      t.integer "error_count",                    default: 0
      t.decimal "score",            precision: 5, scale: 2, default: 0
      t.decimal "workload",         precision: 5, scale: 2, default: 0
      t.decimal "added_value",      precision: 5, scale: 2, default: 0
      t.decimal "maintenance_cost", precision: 5, scale: 2, default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
    end

    create_table "odq_dwh.dim_time", primary_key: "period_id", id: :integer, default: nil, force: :cascade do |t|
      t.integer "playground_id",                     null: false
      t.string "period",                 limit: 6
      t.string "period_day",             limit: 8
      t.date "period_date"
      t.datetime "period_timestamp"
      t.integer "day_of_month"
      t.integer "day_of_year"
      t.integer "day_number"
      t.integer "week_of_month"
      t.integer "week_of_year"
      t.integer "week_number"
      t.integer "month"
      t.string "month_name",             limit: 20
      t.integer "month_number"
      t.integer "trimester_of_year"
      t.integer "trimester_number"
      t.integer "semester_of_year"
      t.integer "semester_number"
      t.integer "year"
      t.integer "year_number"
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.datetime "created_at",                       null: false
      t.datetime "updated_at",                       null: false
    end
    
    # Audit trail
    
    create_table "audit_trails", force: :cascade do |t|
      t.integer  "playground_id",                    null: false
      t.integer  "task_id",                          null: false
      t.string   "action",        limit: 100,        null: false 
      t.integer  "object_id",                        null: false
      t.string   "object_class",  limit: 100
      t.string   "object_name",   limit: 200
      t.integer  "breach_type_id",                default: 0
      t.string   "server_name",   limit: 100
      t.string   "description",   limit: 2000
      t.datetime "created_at",                       null: false
      t.string   "created_by",   limit: 100
    end    

      
  end
end
