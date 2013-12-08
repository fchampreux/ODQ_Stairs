# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Playground.count == 0
  puts "Creating first Playground"
  Playground.create(name: 'Main playground', description: 'This playground is created when initialising ODQ application', code: '1', hierarchy: '1', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', owner_id: 1 )
end
if User.count == 0
  puts "Creating admin user"
  User.create(login: 'Admin', password: 'DQAdmin', password_confirmation: 'DQAdmin', default_playground_id: 1, is_admin: 1, last_name: 'Administrator', first_name: 'Open Data Quality', description: 'First user', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', playground_id: 1, email: 'fred@free.fr')
end
if Parameter.count==0
  puts "Initialising parameters"
  Parameter.create(playground_id: 1, is_list: true, name: 'Lists of parameters', description: 'This list contains all the lists of parameters', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parent_list:  'Lists of parameters')
  Parameter.create(playground_id: 1, is_list: true, name: 'List of statuses', description: 'This list contains statuses allowed values', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parent_list:  'Lists of parameters')
  Parameter.create(playground_id: 1, is_list: true, name: 'List of rules types', description: 'This list contains allowed rules types', active_from: '2000-01-01', active_to: '2100-01-01', created_by: 'Rake', updated_by: 'Rake', created_at: '2000-01-01', updated_at: '2000-01-01', parent_list:  'Lists of parameters')
end

