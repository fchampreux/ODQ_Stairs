# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create(id: 1, [{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(id: 1, name: 'Emanuel', city: cities.first)

puts "Seeding users"
if User.count == 0
  puts "Creating first users"
  User.create( id:0, login: 'Unassigned', password: 'Unassigned', password_confirmation: 'Unassigned', default_playground_id: 1, current_playground_id: 1, current_landscape_id: -1, is_admin: 0, last_name: 'Champreux', first_name: 'Frédéric', description: 'First user', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', playground_id: -1, email: 'service@nohoo.biz')
  User.create( login: 'Admin', password: 'DQAdmin', password_confirmation: 'DQAdmin', default_playground_id: 1, current_playground_id: 1, current_landscape_id: -1, is_admin: 1, last_name: 'Administrator', first_name: 'Open Data Quality', description: 'Admin user', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', playground_id: -1, email: 'service@nohoo.biz')
  User.create( login: 'Fred', password: 'French', password_confirmation: 'DQAdmin', default_playground_id: 1, current_playground_id: 1, current_landscape_id: -1, is_admin: 0, last_name: 'Champreux', first_name: 'Frédéric', description: 'First user', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', playground_id: -1, email: 'service@nohoo.biz')
end

puts "Seeding playgrounds"
if Playground.count == 0
  puts "Creating technical Playgrounds"
  Playground.create( id: 0, hierarchy: '0', name: 'Undefined playground', description: 'This playground is assigned to templates objects', code: 'UNDEFINED', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
  Playground.create( name: 'Main playground', description: 'This playground was created during installation ', code: 'MAIN', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
end

puts "Seeding landscape"
if Landscape.count == 0
  puts "Creating technical Landscapes"
  Landscape.create(id: 0, playground_id: 0, name: 'Undefined landscape', description: 'This landscape is assigned an undefined value', code: 'UNDEFINED', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
  Landscape.create( playground_id: 1, name: 'Default landscape', description: 'This landscape is the first landscape of your project, it was created during installation', code: 'FIRST', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
end

puts "Seeding scope"
if Scope.count == 0
  puts "Creating technical Scopes"
  Scope.create(id: 0, playground_id: 0, landscape_id: -0, name: 'Undefined scope', description: 'This scope is assigned an undefined value', code: 'UNDEFINED', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
  Scope.create( playground_id: 1, landscape_id: 1, name: 'Firt scope of your project', description: 'This scope was created during installation. It targets a data set to which apply business rules', code: 'SCOPE_1', load_interface: 'ToBeDefined', sql_query: 'Select *from dual',created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1 )
end

puts "Seeding organisation"
if Organisation.count == 0
  puts "Creating technical Organisation"
  Organisation.create(id: 0, playground_id: 0, name: 'Undefined organisation', description: 'This organisation is assigned an undefined value', code: 'UNDEFINED', organisation_level: 1, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: -1 )
# Additional setup - Comment out for real deployment
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
  ActiveRecord::Base.connection.execute("UPDATE SEQUENCE organisations_id_seq INCREMENT BY 1 START WITH 100")
end

puts "Seeding territory"
if Territory.count == 0
  puts "Creating technical Territory"
  Territory.create(id: 0, playground_id: 0, name: 'Undefined territory', description: 'This territory is assigned an undefined value', code: 'UNDEFINED', territory_level: 1, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: -1 )
# Additional setup - Comment out for real deployment
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
  ActiveRecord::Base.connection.execute("UPDATE SEQUENCE territories_id_seq INCREMENT BY 1 START WITH 100")
  end

puts "Seeding parameters lists"
if ParametersList.count==0
  puts "Initialising parameters lists"
  ParametersList.create(id: 0, playground_id: 0, name: 'List of Undefined', description: 'This list is assigned an undefined value', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ParametersList.create(id: 1, playground_id: 0, name: 'List of statuses', description: 'This list contains statuses allowed values', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ParametersList.create(id: 2, playground_id: 0, name: 'List of rules types', description: 'This list contains allowed rules types', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ParametersList.create(id: 3, playground_id: 0, name: 'List of display parameters', description: 'This list contains display settings for users', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: true, owner_id: 1)
  ParametersList.create(id: 4, playground_id: 0, name: 'List of rules complexity', description: 'This list contains allowed values for rules complexity', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ParametersList.create(id: 5, playground_id: 0, name: 'List of rules severity', description: 'This list contains allowed values for rules severity', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ParametersList.create(id: 6, playground_id: 0, name: 'List of managed softwares', description: 'This list contains softwares whom business rules are monitored', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ParametersList.create(id: 7, playground_id: 0, name: 'List of breach types', description: 'This list contains the types of breaches', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ParametersList.create(id: 8, playground_id: 0, name: 'List of breach statuses', description: 'This list contains allowed statuses for breaches', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ParametersList.create(id: 9, playground_id: 0, name: 'List of languages', description: 'This list contains translated localizations', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ParametersList.create(id: 10, playground_id: 0, name: 'List of data types', description: 'This list contains business objects skills data types', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', is_user_specific: false, owner_id: 1)
  ActiveRecord::Base.connection.execute("UPDATE SEQUENCE parameters_lists_id_seq INCREMENT BY 1 START WITH 100")
end

puts "Seeding parameters"
if Parameter.count==0
  puts "Initialising parameters"
  Parameter.create(id: 0, playground_id: 0,  name: 'Undefined', description: 'Undefined parameter', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create(id: 1, playground_id: 0,  name: 'New', description: 'Status is New', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create(id: 2, playground_id: 0,  name: 'Active', description: 'Status is Active', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create(id: 3, playground_id: 0,  name: 'Inactive', description: 'Status is Inactive', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create(id: 4, playground_id: 0,  name: 'Obsolete', description: 'Status is Obsolete', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create(id: 5, playground_id: 0,  name: 'Accuracy', description: 'Rule type is Accuracy: attribute fits for the purpose', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create(id: 6, playground_id: 0,  name: 'Completeness', description: 'Rule type is Completeness: mandatory information is present', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create(id: 7, playground_id: 0,  name: 'Conformity', description: 'Rule type is Conformity: Data is stored in required format', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create(id: 8, playground_id: 0,  name: 'Consistency', description: 'Rule type is Consistency: attribute conforms to its domain', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create(id: 9, playground_id: 0,  name: 'Integrity', description: 'Rule type is Integrity: Orphan records should not exist', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create(id: 10, playground_id: 0,  name: 'Non-obsolescence', description: 'Rule type is Non-obsolescence: attribute is valid regarding the period', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create(id: 11, playground_id: 0,  name: 'Uniqueness', description: 'Rule type is Uniqueness:  instance of an object is present only once', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create(id: 12, playground_id: 0,  name: 'Security', description: 'Rule type is Security: object is accessible to granted users only', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create(id: 13, playground_id: 0,  name: 'Show monitoring', description: 'Allows the display of assessment and monitoring features', param_value: 'Yes', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 14, playground_id: 0,  name: 'Nb of lines', description: 'Number of lines to display in lists', param_value: '10', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 15, playground_id: 0,  name: 'Currency', param_value: '€', description: 'Sets the currency for financial risk calculation', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 16, playground_id: 0,  name: 'Duration unit', param_value: 'minutes', description: 'Sets the duration unit for workload calculation', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 17, playground_id: 0,  name: 'Logo filename', param_value: 'ODQ_Logo.png', description: 'Selects the logo image to display', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 18, playground_id: 0,  name: 'Tag 1-Green light', param_code: 'green.png', param_value: '90', description: 'Sets the threshold for displaying a green light', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 19, playground_id: 0,  name: 'Tag 2-Yellow light', param_code: 'yellow.png', param_value: '60', description: 'Sets the threshold for displaying a yellow light', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 20, playground_id: 0,  name: 'Tag 3-Red light', param_code: 'red.png', param_value: '0', description: 'Sets the threshold for displaying a red light', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 21, playground_id: 0,  name: 'Tag 4-Grey light', param_code: 'grey.png', param_value: '0', description: 'Sets the threshold for displaying a grey light', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 22, playground_id: 0,  name: '0-Automated', param_value: 0,  description: 'Automated correction is available', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 4)
  Parameter.create(id: 23, playground_id: 0,  name: '1-Simple', param_value: 1, description: 'Data can be corrected through one simple operation', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 4)
  Parameter.create(id: 24, playground_id: 0,  name: '2-Medium complexity', param_value: 2, description: 'Several operations are needed to correct the data', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 4)
  Parameter.create(id: 25, playground_id: 0,  name: '3-Apply procedure', param_value: 3, description: 'A written procedure must be applied to correct the data', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 4)
  Parameter.create(id: 26, playground_id: 0,  name: '0-Nice to have', param_value: 0,  description: 'Enhancement requested', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 5)
  Parameter.create(id: 27, playground_id: 0,  name: '1-Enhancement required', param_value: 1, description: 'Enhancement must to be planned', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 5)
  Parameter.create(id: 28, playground_id: 0,  name: '2-Correction mandatory', param_value: 2, description: 'Urgent correction is expected', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 5)
  Parameter.create(id: 29, playground_id: 0,  name: '3-Blocking', param_value: 3, description: 'Fix before continuing', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 5)
  Parameter.create(id: 30, playground_id: 0,  name: 'Oracle Applications', param_value: 1, description: 'Oracle Applications ERP version 12.3', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 6)
  Parameter.create(id: 31, playground_id: 0,  name: 'Siebel CRM', param_value: 2, description: 'Oracle Siebel CRM Application', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 6)
  Parameter.create(id: 32, playground_id: 0,  name: 'Global logistics', param_value: 3, description: 'Cloud logistic provider', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 6)
  Parameter.create(id: 33, playground_id: 0,  name: 'Business rule', param_value: 1, description: 'Breach of an identified business rule', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 7)
  Parameter.create(id: 34, playground_id: 0,  name: 'External system', param_value: 2, description: 'Breach reported by an external system', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 7)
  Parameter.create(id: 35, playground_id: 0,  name: 'New breach', param_value: 1, description: 'Newly reported breach', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create(id: 36, playground_id: 0,  name: 'Update submitted', param_value: 2, description: 'Update pening validation', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create(id: 37, playground_id: 0,  name: 'Approved', param_value: 3, description: 'Update approved', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create(id: 38, playground_id: 0,  name: 'Rejected', param_value: 4, description: 'Update rejected', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create(id: 39, playground_id: 0,  name: 'Corrected', param_value: 5, description: 'Correction approved', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create(id: 40, playground_id: 0,  name: 'Closed', param_value: 6, description: 'Incident closed', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create(id: 41, playground_id: 0,  name: 'Date excursion', param_value: 10, description: 'Retrieve the number of days for displaying history in objects tab', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create(id: 42, playground_id: 0,  name: 'English translation', param_code: 'English', param_value: ':en', description: 'Translation language', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 9)
  Parameter.create(id: 43, playground_id: 0,  name: 'Traductions Française', param_code: 'Français', param_value: ':fr', description: 'Translation language', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 9)
  Parameter.create(id: 44, playground_id: 0,  name: 'Traduzioni in italiano', param_code: 'Italiano', param_value: ':it', description: 'Translation language', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 9)
  Parameter.create(id: 45, playground_id: 0,  name: 'Übersetzung auf deutsch', param_code: 'Deutsch', param_value: ':de', description: 'Translation language', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 9)
  Parameter.create(id: 46, playground_id: 0,  name: 'String', param_code: 'A', param_value: '1', description: 'String values', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 10)
  Parameter.create(id: 47, playground_id: 0,  name: 'Numeric', param_code: 'N', param_value: '2', description: 'Numeric values', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 10)
  Parameter.create(id: 48, playground_id: 0,  name: 'Date', param_code: 'D', param_value: '3', description: 'Date values', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 10)
  Parameter.create(id: 49, playground_id: 0,  name: 'Logo splash', param_code: 'D', param_value: 'ODQ_Logo_compact_144.png', description: 'Condensed logo', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  ActiveRecord::Base.connection.execute("UPDATE SEQUENCE parameters_id_seq INCREMENT BY 1 START WITH 100")
end

puts "Seeding values lists"
if ValuesList.count==0
  puts "Initialising values lists"
  ValuesList.create(id: 0, playground_id: 0, name: 'Undefined list', description: 'This list is undefined', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, software_id: -1, table_name: 'UNDEFINED')
end

puts "Seeding values"
if Value.count==0
  puts "Initialising values"
  Value.create(id: 0, playground_id: 0, values_list_id: 0, name: 'Undefined', code: '0', caption: 'UNDEFINED', description: 'Undefined value', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01')
end

puts "Seeding business areas"
if BusinessArea.count==0
  puts "Initialising business areas"
  BusinessArea.create(id: 0, playground_id: 0, code: 'UNDEFINED', name: 'Undefined Business Area',  description: 'This business area is assigned an undefined value', hierarchy: '0', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1  )
end

puts "Seeding business object"
if BusinessObject.count == 0
  puts "Creating first Business Object"
  BusinessObject.create(id: 0, playground_id: 0, business_area_id: , code: 'UNDEFINED', name: 'Undefined business object', description: 'This object is assigned an undefined value', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
end

puts "Seeding business flows"
if BusinessFlow.count==0
  puts "Initialising business flows"
  BusinessFlow.create(id: 0, playground_id: 0, business_area_id: 0, code: 'UNDEFINED', name: 'Undefined business flow', description: 'This business flow is assigned an undefined value', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
end

puts "Seeding business processes"
if BusinessProcess.count==0
  puts "Initialising business processes"
  BusinessProcess.create(id: 0, playground_id: 0, business_flow_id: 0, code: 'UNDEFINED', name: 'Undefined business process', description: 'This business process is assigned an undefined value', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
end

puts "Seeding business rule"
if BusinessRule.count == 0
  puts "Creating Business Rules"
  BusinessRule.create(id: 0, playground_id: 0, business_process_id: 0, business_object_id: , rule_type_id: 0, code: 'UNDEFINED', name: 'Undefined business rule', description: 'This business rule is assigned an undefined value',  created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
end

puts "Seeding time scale"
if TimeScale.count == 0
  puts "Creating Initial Date"
  StartDate = "01/01/2018"
  calendar_date = StartDate.to_date
  1096.times do 
  dow = calendar_date.cwday
  dom = calendar_date.day
  doy = calendar_date.yday
  woy = calendar_date.cweek
  moy = calendar_date.month
  y = calendar_date.year
  p_month = calendar_date.strftime("%Y%m")
  p_day =  calendar_date.strftime("%Y%m%d")
  p_timestamp = calendar_date.to_datetime
  TimeScale.create(playground_id: -1, day_of_week: dow, day_of_month: dom, day_of_year: doy, week_of_year: woy, month_of_year: moy, year: y,
                   period_month: p_month, period_day: p_day, period_date: calendar_date, period_timestamp: p_timestamp,
                   created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01')
  calendar_date += 1
  end
end

puts "SQL Queries"
ActiveRecord::Base.connection.execute("update business_rules set score = (1-cast(bad_records as numeric)/(cast(all_records as numeric)+1)) * 100")
ActiveRecord::Base.connection.execute("update business_objects set score = (1-cast(bad_records as numeric)/(cast(all_records as numeric)+1)) * 100")
ActiveRecord::Base.connection.execute("update business_processes set score = (1-cast(bad_records as numeric)/(cast(all_records as numeric)+1)) * 100")
ActiveRecord::Base.connection.execute("update business_flows set score = (1-cast(bad_records as numeric)/(cast(all_records as numeric)+1)) * 100")
ActiveRecord::Base.connection.execute("update business_areas set score = (1-cast(bad_records as numeric)/(cast(all_records as numeric)+1)) * 100")
ActiveRecord::Base.connection.execute("update scopes set score = (1-cast(bad_records as numeric)/(cast(all_records as numeric)+1)) * 100")
ActiveRecord::Base.connection.execute("update landscapes set score = (1-cast(bad_records as numeric)/(cast(all_records as numeric)+1)) * 100")
ActiveRecord::Base.connection.execute("update playgrounds set score = (1-cast(bad_records as numeric)/(cast(all_records as numeric)+1)) * 100")

