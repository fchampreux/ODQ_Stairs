# coding: utf-8
namespace :db do
    desc 'Create database schemas before going for the first migration'
    task init: ['db:drop','db:create'] do
    ActiveRecord::Base.connection.execute("CREATE SCHEMA odq_app AUTHORIZATION odq_app")
    ActiveRecord::Base.connection.execute("CREATE SCHEMA odq_dwh AUTHORIZATION odq_app")
    puts 'Database initialised'
    end
  end
          
