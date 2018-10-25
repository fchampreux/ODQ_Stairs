class Base < ActiveRecord::Migration[5.1]
  
  def change

# Create global sequence for application-wide identifier unicity
    execute "CREATE SEQUENCE global_seq INCREMENT BY 1 START WITH 1000"
    
# Create application tables
    create_table "breaches", id: :serial do |t|
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
      t.timestamps
    end
  
    create_table "business_areas", id: false do |t|
      t.integer "id", null: false, default: -> { "nextval('global_seq')" }
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
      t.timestamps
      t.index ["playground_id","code"], name: "index_ba_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_ba_on_name", unique: true
      t.index ["hierarchy"], name: "index_ba_on_hierarchy", unique: true
    end
  
    create_table "business_flows", id: false do |t|
      t.integer "id", null: false, default: -> { "nextval('global_seq')" }
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
      t.timestamps
      t.index ["business_area_id","code"], name: "index_bf_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_bf_on_name", unique: true
      t.index ["hierarchy"], name: "index_bf_on_hierarchy", unique: true
    end
  
    create_table "business_objects", id: false do |t|
      t.integer "id", null: false, default: -> { "nextval('global_seq')" }
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
      t.timestamps
      t.index ["business_area_id","code"], name: "index_bo_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_bo_on_name", unique: true
      t.index ["hierarchy"], name: "index_bo_on_hierarchy", unique: true
    end
  
    create_table "business_processes", id: false do |t|
      t.integer "id", null: false, default: -> { "nextval('global_seq')" }
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
      t.timestamps
      t.index ["business_flow_id","code"], name: "index_bp_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_bp_on_name", unique: true
      t.index ["hierarchy"], name: "index_bp_on_hierarchy", unique: true
    end
  
    create_table "business_rules", id: false do |t|
      t.integer "id", null: false, default: -> { "nextval('global_seq')" }
      t.integer "playground_id",                     null: false
      t.integer "business_process_id",               null: false
      t.integer "business_object_id"
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false
      t.text "description"
      t.integer "major_version",                     null: false
      t.integer "minor_version",                     null: false
      t.boolean "is_finalised",                   default: false
      t.text "business_value"
      t.string "hierarchy",              limit: 25,  null: false
      t.text "check_description"
      t.text "check_script"
      t.integer "check_language_id",              default: 0     
      t.text "correction_method"
      t.text "correction_script"
      t.integer "correction_language_id",         default: 0
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
      t.timestamps
      t.index ["business_process_id","code"], name: "index_br_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_br_on_name", unique: true
      t.index ["hierarchy"], name: "index_br_on_hierarchy", unique: true
    end
    
    create_table "groups", id: :serial do |t|
      t.integer "membership_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false
      t.string "description"
      t.integer "territory_id",                      null: false
      t.integer "organisation_id",                   null: false
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.timestamps
      t.index ["code"], name: "index_groups_on_code", unique: true
      t.index ["name" ], name: "index_groups_on_name", unique: true
    end
    
      create_table "memberships", id: :serial do |t|
      t.integer "group_id",                          null: false
      t.integer "user_id",                           null: false
      t.boolean "is_active",                      default: true
      t.datetime "active_from",                      null: false
      t.datetime "active_to",                        null: false
      t.timestamps
      t.index ["group_id, user_id"], name: "index_memberships_on_group", unique: true
      t.index ["user_id, group_id" ], name: "index_memberships_on_user", unique: true
    end
      
    create_table "landscapes", id: false do |t|
      t.integer "id", null: false, default: -> { "nextval('global_seq')" }
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
      t.timestamps
      t.index ["playground_id","code"], name: "index_ls_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_ls_on_name", unique: true
      t.index ["hierarchy"], name: "index_ls_on_hierarchy", unique: true
    end
  
    create_table "mappings", id: :serial do |t|
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
      t.timestamps
      t.index ["mappings_list_id", "source_code", "target_code"], name: "index_map_on_code", unique: true
    end
  
    create_table "mappings_lists", id: :serial do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false 
      t.text "description"
      t.integer "source_list_id",                    null: false
      t.integer "target_list_id",                    null: false
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.timestamps
      t.index ["playground_id", "code"], name: "index_ml_on_code", unique: true
      t.index ["playground_id", "name"], name: "index_ml_on_name", unique: true
    end
  
    create_table "notifications", id: :serial do |t|
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
      t.timestamps
    end
  
    create_table "organisations", id: :serial do |t|
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
      t.timestamps
      t.index ["parent_id","code"], name: "index_org_on_code", unique: true
      t.index ["hierarchy"], name: "index_org_on_hierarchy", unique: true
      t.index ["playground_id", "name" ], name: "index_org_on_name", unique: true
      t.index ["playground_id", "external_reference"], name: "index_org_on_ext_ref", unique: true
    end
  
    create_table "parameters", id: :serial do |t|
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
      t.timestamps
      t.index ["playground_id", "name"], name: "index_param_on_name", unique: true
      t.index ["playground_id", "code"], name: "index_param_on_code", unique: true
    end
  
    create_table "parameters_lists", id: :serial do |t|
      t.integer "playground_id",                     null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false 
      t.text "description"         
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.timestamps
      t.index ["playground_id", "code"], name: "index_pl_on_code", unique: true
      t.index ["playground_id", "name" ], name: "index_pl_on_name", unique: true
    end
  
    create_table "playgrounds", id: :serial do |t|
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
      t.timestamps
      t.index ["code"], name: "index_pg_on_code", unique: true
      t.index ["name" ], name: "index_pg_on_name", unique: true
      t.index ["hierarchy"], name: "index_pg_on_hierarchy", unique: true
    end
  
    create_table "scopes", id: false do |t|
      t.integer "id", null: false, default: -> { "nextval('global_seq')" }
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
      t.timestamps
      t.index ["landscape_id","code"], name: "index_sc_on_code", unique: true
      t.index ["playground_id","name" ], name: "index_sc_on_name", unique: true
      t.index ["hierarchy"], name: "index_sc_on_hierarchy", unique: true
    end
  
    create_table "skills", id: :serial do |t|
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
      t.timestamps
      t.index ["business_object_id", "name"], name: "index_skills_on_bo_name", unique: true
    end
  
    create_table "territories", id: :serial do |t|
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
      t.timestamps
      t.index ["parent_id","code"], name: "index_ter_on_code", unique: true
      t.index ["hierarchy"], name: "index_ter_on_hierarchy", unique: true
      t.index ["playground_id", "name" ], name: "index_ter_on_name", unique: true
      t.index ["playground_id", "external_reference"], name: "index_ter_on_ext_ref", unique: true
    end
  
    create_table "time_scales", primary_key: "period_id" do |t|
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
      t.timestamps
    end
  
    create_table "users", id: :serial do |t|
      t.integer "playground_id",                     null: false
      t.integer "membership_id",                     null: false
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
      t.timestamps
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
  
    create_table "values", id: :serial do |t|
      t.integer "playground_id",                     null: false
      t.integer "values_list_id",                    null: false
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 100, null: false 
      t.text "description"
      t.string "property",               limit: 100
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.timestamps
      t.index ["values_list_id", "code"], name: "index_values_on_code", unique: true
      t.index ["values_list_id", "name"], name: "index_values_on_name", unique: true
    end
  
    create_table "values_lists", id: :serial do |t|
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
      t.timestamps
      t.index ["playground_id", "code"], name: "index_vl_on_code", unique: true
      t.index ["playground_id", "name" ], name: "index_vl_on_name", unique: true
    end
    
    create_table "activities", id: false do |t|
      t.integer "id", null: false, default: -> { "nextval('global_seq')" }
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
      t.timestamps
      t.index ["business_process_id","code"], name: "index_act_on_code", unique: true
      t.index ["hierarchy"], name: "index_act_on_hierarchy", unique: true
      t.index ["playground_id", "name" ], name: "index_act_on_name", unique: true
    end
    
    create_table "tasks", id: false do |t|
      t.integer "id", null: false, default: -> { "nextval('global_seq')" }
      t.integer "playground_id",                     null: false
      t.references :todo, polymorphic: true
      t.string "code",                   limit: 60,  null: false
      t.string "name",                   limit: 200, null: false
      t.text "description"
      t.string "hierarchy",              limit: 25,  null: false
      t.string "pcf_index",              limit: 30
      t.string "pcf_reference",          limit: 100
      t.text "script"
      t.integer "language_id",                    default: 0    
      t.integer "software_id"
      t.string "external_reference",     limit: 100
      t.integer "status_id",                         null: false
      t.integer "owner_id",                          null: false
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.timestamps
      t.index ["activity_id","code"], name: "index_task_on_code", unique: true
      t.index ["hierarchy"], name: "index_task_on_hierarchy", unique: true
      t.index ["playground_id", "name" ], name: "index_task_on_name", unique: true
    end

# Create temorary table for imports

    create_table :business_hierarchies, id: :serial do |t|
      t.integer "playground_id"
      t.string "pcf_index"
      t.string "pcf_reference"
      t.integer "hierarchical_level"
      t.string "hierarchy"
      t.string "name"
      t.text "description"
      t.timestamps
      t.index ["hierarchy"], name: "index_BH_on_hierarchy", unique: true
      t.index ["hierarchical_level"], name: "index_BH_on_level"
    end

# Create Data Marts for analysis

   create_table "odq_dwh.dm_processes", id: :serial do |t|
      t.integer "playground_id",                     null: false
      t.integer "odq_object_id",                     null: false
      t.integer "odq_parent_id",                     null: false
      t.string "odq_object_name",        limit: 100
      t.string "odq_object_code",        limit: 100
      t.string "odq_object_url",         limit: 100
      t.integer "period_id",                         null: false
      t.string "period_day",             limit: 8
      t.integer "organisation_id",                   null: false
      t.integer "territory_id",                      null: false
      t.integer "all_records",                    default: 0
      t.integer "error_count",                    default: 0
      t.decimal "score",            precision: 5, scale: 2, default: 0
      t.decimal "workload",         precision: 12, scale: 2, default: 0
      t.decimal "added_value",      precision: 12, scale: 2, default: 0
      t.decimal "maintenance_cost", precision: 12, scale: 2, default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.timestamps
    end
   
    create_table "odq_dwh.dm_scopes", id: :serial do |t|
      t.integer "playground_id",                     null: false
      t.integer "odq_object_id",                     null: false
      t.integer "odq_parent_id",                     null: false
      t.string "odq_object_name",        limit: 100
      t.string "odq_object_code",        limit: 100
      t.string "odq_object_url",         limit: 100
      t.integer "period_id",                         null: false
      t.string "period_day",             limit: 8
      t.integer "organisation_id",                   null: false
      t.integer "territory_id",                      null: false
      t.integer "all_records",                    default: 0
      t.integer "error_count",                    default: 0
      t.decimal "score",            precision: 5, scale: 2, default: 0
      t.decimal "workload",         precision: 12, scale: 2, default: 0
      t.decimal "added_value",      precision: 12, scale: 2, default: 0
      t.decimal "maintenance_cost", precision: 12, scale: 2, default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.timestamps
    end
   
    create_table "odq_dwh.dm_activities", id: :serial do |t|
      t.integer "playground_id",                     null: false
      t.integer "odq_object_id",                     null: false
      t.integer "odq_parent_id",                     null: false
      t.string "odq_object_name",        limit: 100
      t.string "odq_object_code",        limit: 100
      t.string "odq_object_url",         limit: 100
      t.integer "period_id",                         null: false
      t.string "period_day",             limit: 8
      t.integer "organisation_id",                   null: false
      t.integer "territory_id",                      null: false
      t.integer "all_records",                    default: 0
      t.integer "error_count",                    default: 0
      t.decimal "score",            precision: 5, scale: 2, default: 0
      t.decimal "workload",         precision: 12, scale: 2, default: 0
      t.decimal "added_value",      precision: 12, scale: 2, default: 0
      t.decimal "maintenance_cost", precision: 12, scale: 2, default: 0
      t.string "created_by",             limit: 100, null: false
      t.string "updated_by",             limit: 100, null: false
      t.timestamps
    end

    create_table "odq_dwh.dim_time", primary_key: "period_id", id: :integer, default: nil do |t|
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
      t.timestamps
    end
    
# Create Audit trail table
    
    create_table "audit_trails" do |t|
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
