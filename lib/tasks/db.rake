namespace :db do
    desc 'Create database schemas before going for the first migration'
    task init: ['db:drop','db:create'] do
    ActiveRecord::Base.connection.execute("CREATE SCHEMA odq_app AUTHORIZATION odq_app")
    ActiveRecord::Base.connection.execute("CREATE SCHEMA odq_dwh AUTHORIZATION odq_app")
    puts 'Database initialised'
    end
  end

namespace :db do
    desc 'Initialise evaluation users'
    task evaluation: :environment do
    if User.count == 2
      puts 'Creating evaluation user USER1'
      User.create( code: 'USER1', user_name: 'user1', password: 'DQAdmin', password_confirmation: 'DQAdmin', default_playground_id: 1, current_playground_id: 1, current_landscape_id: 1, is_admin: 0, last_name: 'User', first_name: 'My First', description: 'First user', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', playground_id: 0, email: 'user2@nohoo.biz')
    end
    
    desc 'Create evaluation playground'
    task evaluation: environment do
    if Playground.count == 1
      puts 'Creating playground 1'
      Playground.create(name: 'Evaluation playground', description: 'This playground is created during initialisation for evaluation purpose', code: 'EVAL', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1 )
    end
    
    desc 'Create evaluation landscapes'
    if Landscape.count == 1
      puts 'Creating evaluation Landscapes'
      Landscape.create(playground_id: 1, name: 'Item landscape', description: 'This landscape is dedicated to the audit of all processes impacting Item Master Data', code: 'ITEM', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1 )
      Landscape.create(playground_id: 1, name: 'Audit landscape', description: 'This landscape is created during initialiation', code: 'AUDIT', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1 )
    end
    
    desc 'Create evaluation scopes'    
    if Scope.count == 1
      puts 'Creating first Scopes'
      Scope.create(id: 1101, playground_id: 1, landscape_id: 1, name: 'FP Item Master view', description: 'This scope is created when initialising ODQ application', code: 'ITEM', load_interface: 'ODS_load_DWH_ItemMaster', SQL_query: 'Select *
        from APPS.XX_INVENTORY_ITEM_MASTER_V
        where ITEM_TYPE = "FP"
        and IS_ACTIVE = 1',created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1 )
      Scope.create(id: 1102, playground_id: 1, landscape_id: 1, name: 'No category Item Master view', description: 'This scope is created when initialising ODQ application', code: 'ITEM', load_interface: 'ODS_load_DWH_ItemMaster', SQL_query: 'Select *
        from APPS.XX_INVENTORY_ITEM_MASTER_V
        where ITEM_TYPE = "None"
        and IS_ACTIVE = 1',created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1 )
      Scope.create(id: 1103, playground_id: 1, landscape_id: 1, name: 'Not FP Item Master view', description: 'This scope is created when initialising ODQ application', code: 'ITEM', load_interface: 'ODS_load_DWH_ItemMaster', SQL_query: 'Select *
        from APPS.XX_INVENTORY_ITEM_MASTER_V
        where ITEM_TYPE <> "FP"
        and IS_ACTIVE = 1',created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1 )
    end
    
    desc 'Create evaluation business object'
      if BusinessObject.count == 1
        puts 'Creating first Business Object'
        BusinessObject.create(playground_id: 1, business_area_id: 5, code: 'ITEM_MD', name: 'Inventory Item Master', description: 'This object describes the Master Data for Inventory Items', db_technology: 'Oracle 11g', db_connection: 'ERP@PROD.server.com', db_owner_schema: 'ERP_APP', structure_name: 'XX_INV_ITEM_MASTER', key_columns: 'ITEM_ID', published_columns: 'ITEM_ID; ITEM_NO; ITEM_NAME; BRAND; STATUS', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1)
      end
    
    desc 'Create evaluation Business Area'
    task evaluation: environment do
    if BusinessArea.count == 1
      BusinessArea.create(playground_id: 1001, code: 'A', name: 'Advanced Supply Chain Planning', pcf_reference: 'A', description: 'Advanced Supply Chain Planning', hierarchy: '01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'B', name: 'Process Manufacturing', pcf_reference: 'B', description: 'Process Manufacturing', hierarchy: '02', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'C', name: 'Enterprise Asset Management', pcf_reference: 'C', description: 'Enterprise Asset Management', hierarchy: '03', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'D', name: 'Purchase Order Management', pcf_reference: 'D', description: 'Purchase Order Management', hierarchy: '04', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'E', name: 'Inventory Management', pcf_reference: 'E', description: 'Inventory Management', hierarchy: '05', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'F', name: 'Order Management', pcf_reference: 'F', description: 'Order Management', hierarchy: '06', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'G', name: 'Accounts Receivable', pcf_reference: 'G', description: 'Accounts Receivable', hierarchy: '07', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'H', name: 'Accounts Payable', pcf_reference: 'H', description: 'Accounts Payable', hierarchy: '08', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1 )
      BusinessArea.create(playground_id: 1001, code: 'I', name: 'Fixed Assets', pcf_reference: 'I', description: 'Fixed Assets', hierarchy: '09', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'J', name: 'General Ledger', pcf_reference: 'J', description: 'General Ledger', hierarchy: '10', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'K', name: 'Cash Management', pcf_reference: 'K', description: 'Cash Management', hierarchy: '11', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'L', name: 'EBusiness Tax', pcf_reference: 'L', description: 'EBusiness Tax', hierarchy: '12', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
      BusinessArea.create(playground_id: 1001, code: 'O', name: 'Oracle Generic', pcf_reference: 'O ', description: 'Oracle Generic', hierarchy: '13', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
   #   BusinessArea.create(playground_id: 1002, code: 'ERP', name: 'Enterprise Resources Planning', description: 'ERP integration transactions', hierarchy: '01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
   #   BusinessArea.create(playground_id: 1002, code: 'CRM', name: 'Customer Relationship Management', description: 'CRM integration transactions', hierarchy: '02', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
   #   BusinessArea.create(playground_id: 1002, code: 'LOG', name: 'Logistic Support Tier', description: 'Logistics integration transactions', hierarchy: '03', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1  )
    end
      
    desc 'Create evaluation Business Flows'
    task evaluation: environment do
    if BusinessFlow.count == 1
    end
      
    desc 'Create evaluation Business Processes'
    task evaluation: environment do
    if BusinessProcesse.count == 1
    end

    desc 'Create evaluation Business Rules'
    task evaluation: environment do
    if BusinessRule.count == 1
    end  
      
    desc 'Inititalise territories'
    if Territory.count == 1
      puts "Creating technical Territories hierarchy"
        Territory.create(id: 1, playground_id: 1, name: 'World', description: 'This territory is created when initialising ODQ application as the root for geography hierarchy', code: 'WORLD', territory_level: 1, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: -1 )
        Territory.create(id: 2, playground_id: 1, name: 'Europe & Middle East', description: 'Europe & Middle East', code: 'EMEA', territory_level: 2, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 1 )
        Territory.create(id: 3, playground_id: 1, name: 'Americas', description: 'Americas', code: 'AME', territory_level: 2, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 1 )
        Territory.create(id: 4, playground_id: 1, name: 'Oceania', description: 'Oceania', code: 'OCEAN', territory_level: 2, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 1 )
        Territory.create(id: 5, playground_id: 1, name: 'Africa', description: 'Africa', code: 'AFRIC', territory_level: 2, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 1 )
        Territory.create(id: 6, playground_id: 1, name: 'Europe', description: 'Europe', code: 'EUR', territory_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 2 )
        Territory.create(id: 7, playground_id: 1, name: 'Middle East', description: 'Middle East', code: 'MEA', territory_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 2 )
        Territory.create(id: 8, playground_id: 1, name: 'North America', description: 'North America', code: 'NAM', territory_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 3 )
        Territory.create(id: 9, playground_id: 1, name: 'Latin America', description: 'Latin America', code: 'LAM', territory_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 3 )
        Territory.create(id: 10, playground_id: 1, name: 'South America', description: 'South America', code: 'SAM', territory_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 3 )
        Territory.create(id: 11, playground_id: 1, name: 'Australia', description: 'Australia', code: 'AUS', territory_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 4 )
        Territory.create(id: 12, playground_id: 1, name: 'Pacific Islands', description: 'Pacific Islands', code: 'PCI', territory_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 4 )
        Territory.create(id: 13, playground_id: 1, name: 'North Africa', description: 'North Africa', code: 'NAF', territory_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 5 )
        Territory.create(id: 14, playground_id: 1, name: 'South Africa', description: 'South Africa', code: 'SAF', territory_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 5 )
        ActiveRecord::Base.connection.execute("ALTER SEQUENCE territories_id_seq INCREMENT BY 1 START WITH 100")
      end
    
    desc 'Initialise organisations'
    if Organisation.count == 1
        puts "Creating Organisations hierarchy"
        Organisation.create(id: 1, playground_id: 1, name: 'Global organisation', description: 'This organisation is created when initialising ODQ application as the root for organisations hierarchy', code: 'GLOBAL', organisation_level: 1, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: -1 )
        Organisation.create(id: 2, playground_id: 1, name: 'Marketing', description: 'Marketing organisations', code: 'MKT', organisation_level: 2, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 1 )
        Organisation.create(id: 3, playground_id: 1, name: 'Sales', description: 'Sales divisions', code: 'SALES', organisation_level: 2, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 1 )
        Organisation.create(id: 4, playground_id: 1, name: 'Production', description: 'Production and plants', code: 'PROD', organisation_level: 2, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 1 )
        Organisation.create(id: 5, playground_id: 1, name: 'Legal and accounting', description: 'Administration', code: 'ACC', organisation_level: 2, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 1 )
        Organisation.create(id: 6, playground_id: 1, name: 'Human resources', description: 'HR department', code: 'HR', organisation_level: 2, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 1 )
        Organisation.create(id: 7, playground_id: 1, name: 'Consumer goods', description: 'End customer marketing', code: 'CUS', organisation_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 2 )
        Organisation.create(id: 8, playground_id: 1, name: 'Professional', description: 'Professional customer marketing', code: 'PROF', organisation_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 2 )
        Organisation.create(id: 9, playground_id: 1, name: 'Hospitals and organisations', description: 'Organisations sales', code: 'DIR', organisation_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 3 )
        Organisation.create(id: 10, playground_id: 1, name: 'Resalers', description: 'Resalers sales', code: 'RES', organisation_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 3 )
        Organisation.create(id: 11, playground_id: 1, name: 'Clinical trials', description: 'Internal reseach sales', code: 'INT', organisation_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 3 )
        Organisation.create(id: 12, playground_id: 1, name: 'Finished goods', description: 'Finished products', code: 'FP', organisation_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 4 )
        Organisation.create(id: 13, playground_id: 1, name: 'Active Pharmaceuticals Ingredients', description: 'Bulk products', code: 'API', organisation_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 4 )
        Organisation.create(id: 14, playground_id: 1, name: 'Packaging', description: 'Packaing activity', code: 'PACK', organisation_level: 3, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 4 )
        ActiveRecord::Base.connection.execute("ALTER SEQUENCE organisations_id_seq INCREMENT BY 1 START WITH 100")
      end
    
      if AuditTrail.count<=1
        puts "Registering seed activity"
        AuditTrail.create( playground_id: 0, task_id: 5, action: "Evaluation", object_id: 0, description: "Running evaluation data creation script", created_by: "RAKE")
      end
        
      puts "SQL Queries"
      ActiveRecord::Base.connection.execute("update users set confirmed_at = now() where user_name = 'user1' ")
    end
  end
          