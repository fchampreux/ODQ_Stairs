# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if User.count == 0
  puts "Creating admin user"
  User.create(login: 'Admin', password: 'DQAdmin', default_playground: 0, is_admin: 1, last_name: 'Administrator', first_name: 'Open Data Quality', active_to: '2100-01-01' )
end
