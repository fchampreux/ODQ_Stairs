# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create(id: 1, [{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(id: 1, name: 'Emanuel', city: cities.first)

puts "Initialise global sequence" # Used by object hierarchies to get an application-wide Id for easing reporting
#ActiveRecord::Base.connection.execute("DROP SEQUENCE global_seq")
ActiveRecord::Base.connection.execute("CREATE SEQUENCE global_seq INCREMENT BY 1 START WITH 10000")

puts "Seeding users"
if User.count == 0
  puts "Creating first users"
  User.create( id:0, code: 'Unassigned', user_name: 'Unassigned', password: 'Unassigned', password_confirmation: 'Unassigned', default_playground_id: 0, current_playground_id: 0, current_landscape_id: 0, is_admin: 0, last_name: 'User', first_name: 'Undefined', description: 'First user', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', playground_id: 0, email: 'service@nohoo.biz')
  User.create( code: 'ADM', user_name: 'Admin', password: 'DQAdmin', password_confirmation: 'DQAdmin', default_playground_id: 1, current_playground_id: 1, current_landscape_id: 1, is_admin: 1, last_name: 'Administrator', first_name: 'Open Data Quality', description: 'Admin user', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', playground_id: 0, email: 'user1@nohoo.biz')
#  User.create( code: 'FCH', user_name: 'Fred', password: 'French', password_confirmation: 'French', default_playground_id: 1, current_playground_id: 1, current_landscape_id: 1, is_admin: 0, last_name: 'Champreux', first_name: 'Frédéric', description: 'First user', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', playground_id: 0, email: 'user2@nohoo.biz')
end

puts "Seeding playgrounds"
if Playground.count == 0
  puts "Creating Playgrounds"
  Playground.create( id: 0, playground_id: 0, hierarchy: '0', name: 'Undefined playground', description: 'This playground is assigned to templates objects', code: 'UNDEFINED', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
  Playground.create( playground_id: 1, hierarchy: '1', name: 'Main playground', description: 'This playground was created during installation ', code: 'MAIN', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
end

puts "Seeding landscape"
if Landscape.count == 0
  puts "Creating Landscapes"
  Landscape.create(id: 0, playground_id: 0, hierarchy: '0', name: 'Undefined landscape', description: 'This landscape is assigned an undefined value', code: 'UNDEFINED', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
  Landscape.create( playground_id: 1, hierarchy: '1', name: 'Default landscape', description: 'This landscape is the first landscape of your project, it was created during installation', code: 'FIRST', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
end

puts "Seeding scope"
if Scope.count == 0
  puts "Creating technical Scopes"
  Scope.create(id: 0, playground_id: 0, landscape_id: 0, hierarchy: '0', name: 'Undefined scope', description: 'This scope is assigned an undefined value', code: 'UNDEFINED', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
  Scope.create( playground_id: 1, landscape_id: 1, hierarchy: '1', name: 'Firt scope of your project', description: 'This scope was created during installation. It targets a data set to which apply business rules', code: 'SCOPE_1', load_interface: 'ToBeDefined', sql_query: 'Select *from dual',created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', all_records: 22000, bad_records: 1800, owner_id: 1, status_id: 1 )
end

puts "Seeding organisation"
if Organisation.count == 0
  puts "Creating technical Organisation"
  Organisation.create(id: 0, playground_id: 0, hierarchy: '0', name: 'Undefined organisation', description: 'This organisation is assigned an undefined value', code: 'UNDEFINED', organisation_level: 1, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: 0 )
end

puts "Seeding territory"
if Territory.count == 0
  puts "Creating technical Territory"
  Territory.create(id: 0, playground_id: 0, hierarchy: '0', name: 'Undefined territory', description: 'This territory is assigned an undefined value', code: 'UNDEFINED', territory_level: 1, created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1, parent_id: -1 )
end

puts "Seeding parameters lists"
if ParametersList.count==0
  puts "Initialising parameters lists"
  ParametersList.create(id: 0, playground_id: 0, name: 'List of Undefined', description: 'This list is assigned an undefined value', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 1, playground_id: 0, name: 'List of statuses', description: 'This list contains statuses allowed values', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 2, playground_id: 0, name: 'List of rules types', description: 'This list contains allowed rules types', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 3, playground_id: 0, name: 'List of display parameters', description: 'This list contains display settings for users', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 4, playground_id: 0, name: 'List of rules complexity', description: 'This list contains allowed values for rules complexity', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 5, playground_id: 0, name: 'List of rules severity', description: 'This list contains allowed values for rules severity', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 6, playground_id: 0, name: 'List of managed softwares', description: 'This list contains softwares whom business rules are monitored', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 7, playground_id: 0, name: 'List of breach types', description: 'This list contains the types of breaches', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 8, playground_id: 0, name: 'List of breach statuses', description: 'This list contains allowed statuses for breaches', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 9, playground_id: 0, name: 'List of languages', description: 'This list contains translated localizations', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 10, playground_id: 0, name: 'List of data types', description: 'This list contains business objects skills data types', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ParametersList.create(id: 11, playground_id: 0, name: 'List of object types', description: 'This list contains ODQ objects types', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1)
  ActiveRecord::Base.connection.execute("ALTER SEQUENCE parameters_lists_id_seq INCREMENT BY 1 START WITH 100")
end

puts "Seeding parameters"
if Parameter.count==0
  puts "Initialising parameters"
  Parameter.create(id: 0, playground_id: 0,  name: 'Undefined', code: 'UNDEFINED', property: '0', description: 'Undefined parameter', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create( playground_id: 0,  name: 'New', code: 'NEW', property: '0', description: 'Status is New', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create( playground_id: 0,  name: 'Active', code: 'ACTIVE', property: '0', description: 'Status is Active', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create( playground_id: 0,  name: 'Inactive', code: 'INACTIVE', property: '0', description: 'Status is Inactive', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create( playground_id: 0,  name: 'Obsolete', code: 'OBSOLETE', property: '0', description: 'Status is Obsolete', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 1)
  Parameter.create( playground_id: 0,  name: 'Accuracy', code: 'ACCURACY', property: '0', description: 'Rule type is Accuracy: attribute fits for the purpose', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create( playground_id: 0,  name: 'Completeness', code: 'COMPLETENESS', property: '0', description: 'Rule type is Completeness: mandatory information is present', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create( playground_id: 0,  name: 'Conformity', code: 'CONFORMITY', property: '0', description: 'Rule type is Conformity: Data is stored in required format', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create( playground_id: 0,  name: 'Consistency', code: 'CONSISTENCY', property: '0', description: 'Rule type is Consistency: attribute conforms to its domain', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create( playground_id: 0,  name: 'Integrity', code: 'INTEGRITY', property: '0', description: 'Rule type is Integrity: Orphan records should not exist', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create( playground_id: 0,  name: 'Non-obsolescence', code: 'OBSOLESCENCE', property: '0', description: 'Rule type is Non-obsolescence: attribute is valid regarding the period', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create( playground_id: 0,  name: 'Uniqueness', code: 'UNIQUENESS', property: '0', description: 'Rule type is Uniqueness:  instance of an object is present only once', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create( playground_id: 0,  name: 'Security', code: 'SECURITY', property: '0', description: 'Rule type is Security: object is accessible to granted users only', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 2)
  Parameter.create( playground_id: 0,  name: 'Show monitoring', code: 'MONITORING', property: 'Yes', description: 'Allows the display of assessment and monitoring features', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'Nb of lines', code: 'LINES', property: '10', description: 'Number of lines to display in lists', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'Currency', code: 'CURRENCY', property: '€', description: 'Sets the currency for financial risk calculation', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'Duration unit', code: 'DURATION', property: 'minutes', description: 'Sets the duration unit for workload calculation', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'Logo filename', code: 'LOGO', property: 'ODQ_Logo.png', description: 'Selects the logo image to display', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'Tag 1-Green light', code: 'green.png', property: '90', description: 'Sets the threshold for displaying a green light', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'Tag 2-Yellow light', code: 'yellow.png', property: '60', description: 'Sets the threshold for displaying a yellow light', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'Tag 3-Red light', code: 'red.png', property: '0', description: 'Sets the threshold for displaying a red light', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'Tag 4-Grey light', code: 'grey.png', property: '0', description: 'Sets the threshold for displaying a grey light', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: '0-Automated', code: 'AUTOMATED', property: 0,  description: 'Automated correction is available', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 4)
  Parameter.create( playground_id: 0,  name: '1-Simple', code: 'SIMPLE', property: 1, description: 'Data can be corrected through one simple operation', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 4)
  Parameter.create( playground_id: 0,  name: '2-Medium complexity', code: 'COMPLEX', property: 2, description: 'Several operations are needed to correct the data', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 4)
  Parameter.create( playground_id: 0,  name: '3-Apply procedure', code: 'PROCEDURE', property: 3, description: 'A written procedure must be applied to correct the data', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 4)
  Parameter.create( playground_id: 0,  name: '0-Nice to have', code: 'NICE', property: 0,  description: 'Enhancement requested', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 5)
  Parameter.create( playground_id: 0,  name: '1-Enhancement required', code: 'ENHANCEMENT', property: 1, description: 'Enhancement must to be planned', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 5)
  Parameter.create( playground_id: 0,  name: '2-Correction mandatory', code: 'CORRECTION', property: 2, description: 'Urgent correction is expected', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 5)
  Parameter.create( playground_id: 0,  name: '3-Blocking', code: 'BLOCKING', property: 3, description: 'Fix before continuing', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 5)
#  Parameter.create( playground_id: 0,  name: 'Oracle Applications', code: 'ORACLE', property: 1, description: 'Oracle Applications ERP version 12.3', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 6)
#  Parameter.create( playground_id: 0,  name: 'Siebel CRM', code: 'SIEBEL', property: 2, description: 'Oracle Siebel CRM Application', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 6)
#  Parameter.create( playground_id: 0,  name: 'Global logistics', code: 'LOGISTICS', property: 3, description: 'Cloud logistic provider', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 6)
  Parameter.create( playground_id: 0,  name: 'Business rule', code: 'BUSINESS_RULE', property: 1, description: 'Breach of an identified business rule', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 7)
  Parameter.create( playground_id: 0,  name: 'Initialisation', code: 'INIT', property: 1, description: 'Breach of PCF framework initial load', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 7)
  Parameter.create( playground_id: 0,  name: 'External system', code: 'EXTERNAL', property: 2, description: 'Breach reported by an external system', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 7)
  Parameter.create( playground_id: 0,  name: 'New breach', code: 'NEW_BREACH', property: 1, description: 'Newly reported breach', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create( playground_id: 0,  name: 'Update submitted', code: 'UPDATE_SUBMITTED', property: 2, description: 'Update pening validation', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create( playground_id: 0,  name: 'Approved', code: 'APPROVED', property: 3, description: 'Update approved', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create( playground_id: 0,  name: 'Rejected', code: 'REJECTED', property: 4, description: 'Update rejected', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create( playground_id: 0,  name: 'Corrected', code: 'CORRECTED', property: 5, description: 'Correction approved', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create( playground_id: 0,  name: 'Closed', code: 'CLOSED', property: 6, description: 'Incident closed', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 8)
  Parameter.create( playground_id: 0,  name: 'Date excursion', code: 'DATE', property: 10, description: 'Retrieve the number of days for displaying history in objects tab', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'English translation', code: 'ENGLISH', property: ':en', description: 'Translation language', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 9)
  Parameter.create( playground_id: 0,  name: 'Traductions Française', code: 'FRENCH', property: ':fr', description: 'Translation language', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 9)
  Parameter.create( playground_id: 0,  name: 'Traduzioni in italiano', code: 'ITALIAN', property: ':it', description: 'Translation language', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 9)
  Parameter.create( playground_id: 0,  name: 'Übersetzung auf deutsch', code: 'GERMAN', property: ':de', description: 'Translation language', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 9)
  Parameter.create( playground_id: 0,  name: 'String', code: 'A', property: '1', description: 'String values', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 10)
  Parameter.create( playground_id: 0,  name: 'Numeric', code: 'N', property: '2', description: 'Numeric values', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 10)
  Parameter.create( playground_id: 0,  name: 'Date', code: 'D', property: '3', description: 'Date values', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 10)
  Parameter.create( playground_id: 0,  name: 'Logo splash', code: 'LOGO144', property: 'ODQ_Logo_compact_144.png', description: 'Condensed logo', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 3)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'PG', property: '0', description: 'Playground', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'BA', property: '1', description: 'Business Area', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'BF', property: '2', description: 'Business Flow', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'BP', property: '3', description: 'Business Process', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'BR', property: '4', description: 'Business Rule', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'ACT', property: '5', description: 'Activity', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'TASK', property: '6', description: 'Task', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'LS', property: '7', description: 'Landscape', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'SC', property: '8', description: 'Scope', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
  Parameter.create( playground_id: 0,  name: 'Playground', code: 'BO', property: '9', description: 'Business Object', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parameters_list_id: 11)
end

puts "Seeding values lists"
if ValuesList.count==0
  puts "Initialising values lists"
  ValuesList.create(id: 0, playground_id: 0, code: 'UNDEFINED', name: 'Undefined list', description: 'This list is undefined', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, software_id: 0, table_name: 'UNDEFINED')
end

puts "Seeding values"
if Value.count==0
  puts "Initialising values"
  Value.create(id: 0, playground_id: 0, values_list_id: 0, name: 'Undefined', code: '0', property: 'UNDEFINED', description: 'Undefined value', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01')
end

puts "Seeding business areas"
if BusinessArea.count==0
  puts "Initialising business areas"
  BusinessArea.create(id: 0, playground_id: 0, code: 'UNDEFINED', name: 'Undefined Business Area',  description: 'This business area is assigned an undefined value', hierarchy: '0', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1  )
end

puts "Seeding business object"
if BusinessObject.count == 0
  puts "Creating first Business Object"
  BusinessObject.create(id: 0, playground_id: 0, business_area_id: 0, code: 'UNDEFINED', name: 'Undefined business object', description: 'This object is assigned an undefined value', hierarchy: '0', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
end

puts "Seeding business flows"
if BusinessFlow.count==0
  puts "Initialising business flows"
  BusinessFlow.create(id: 0, playground_id: 0, business_area_id: 0, code: 'UNDEFINED', name: 'Undefined business flow', description: 'This business flow is assigned an undefined value', hierarchy: '0', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
end

puts "Seeding business processes"
if BusinessProcess.count==0
  puts "Initialising business processes"
  BusinessProcess.create(id: 0, playground_id: 0, business_flow_id: 0, code: 'UNDEFINED', name: 'Undefined business process', description: 'This business process is assigned an undefined value', hierarchy: '0', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1 )
end

puts "Seeding business rule"
if BusinessRule.count == 0
  puts "Creating Business Rules"
  BusinessRule.create(id: 0, playground_id: 0, business_process_id: 0, business_object_id: 0, rule_type_id: 0, severity_id: 0, complexity_id: 0, code: 'UNDEFINED', name: 'Undefined business rule', description: 'This business rule is assigned an undefined value', hierarchy: '0', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
end

puts "Seeding activity"
if Activity.count == 0
  puts "Creating Activity"
  Activity.create(id: 0, playground_id: 0, business_process_id: 0, code: 'UNDEFINED', name: 'Undefined activity', description: 'This activity is assigned an undefined value',  created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
  Activity.create(playground_id: 0, business_process_id: 0, code: 'INIT', name: 'Initialising DQP', description: 'This activity relates to software intialisation',  created_by: 'Rake', updated_by: 'Rake', :created_at => DateTime.now.to_date, :updated_at => DateTime.now.to_date, owner_id: 1, status_id: 1)
end

puts "Seeding task"
if Task.count == 0
  puts "Creating Task"
  Task.create(id: 0, playground_id: 0, activity_id: 0, code: 'UNDEFINED', name: 'Undefined task', description: 'This task is assigned an undefined value',  created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
  Task.create(playground_id: 0, activity_id: 1, code: 'INIT BA', name: 'Initialising Business Areas', description: 'This imports business areas from APQC',  created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
  Task.create(playground_id: 0, activity_id: 1, code: 'INIT BF', name: 'Initialising Business Flows', description: 'This imports business flows from APQC from APQC',  created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
  Task.create(playground_id: 0, activity_id: 1, code: 'INIT BP', name: 'Initialising Business Processes', description: 'This imports business processes from APQC',  created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
  Task.create(playground_id: 0, activity_id: 1, code: 'INIT ACT', name: 'Initialising Activities', description: 'This imports business activities from APQC',  created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
  Task.create(playground_id: 0, activity_id: 1, code: 'INIT TASKS', name: 'Initialising Tasks', description: 'This imports tasks from APQC',  created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1, status_id: 1)
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
  TimeScale.create(playground_id: 0, day_of_week: dow, day_of_month: dom, day_of_year: doy, week_of_year: woy, month_of_year: moy, year: y,
                   period_month: p_month, period_day: p_day, period_date: calendar_date, period_timestamp: p_timestamp,
                   created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01')
  calendar_date += 1
  end
end

if AuditTrail.count<=1
  puts "Registering seed activity"
  AuditTrail.create( playground_id: 0, task_id: 5, action: "Initialize", object_id: 0, description: "Running initial data creation script", created_by: "RAKE")
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
ActiveRecord::Base.connection.execute("update users set confirmed_at = now()")

