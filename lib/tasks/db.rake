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
    if User.count = 2
      pust 'Creating users'
      User.create( code: 'USER1', user_name: 'user1', password: 'DQAdmin', password_confirmation: 'DQAdmin', default_playground_id: 1, current_playground_id: 1, current_landscape_id: 1, is_admin: 0, last_name: 'User', first_name: 'My First', description: 'First user', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', playground_id: 0, email: 'user2@nohoo.biz')
    end
    
    desc 'Inititalise territories'
    if Territory.count = 1
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
    if Organisation.count = 1
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
    
      if AuditTrail.count==1
        puts "Registering seed activity"
        AuditTrail.create( user_id: 1, action: "Initialize", object_id: 0, description: "Running demo data creation script", created_by: "RAKE")
      end
        
      puts "SQL Queries"
      ActiveRecord::Base.connection.execute("update users set confirmed_at = now() where user_name = 'user1' ")
    end
  end
          