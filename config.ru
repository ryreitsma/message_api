require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'grape-entity'
require 'active_record'

# Require all application classes
Dir['./app/**/*.rb'].each {|f| require f}

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/development.sqlite3",
  pool: 5,
  timeout: 5000
)

use ActiveRecord::ConnectionAdapters::ConnectionManagement
run MessageAPI
