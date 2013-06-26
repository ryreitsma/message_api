require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'grape-entity'
require 'active_record'
require 'yaml'

$:.unshift File.dirname(__FILE__)
# Require all application classes
Dir['./app/**/*.rb'].each {|f| require f}

ENVIRONMENT = ENV['RACK_ENV'] || 'development'

ActiveRecord::Base.establish_connection(
 YAML.load_file('config/database.yml')[ENVIRONMENT]
)

use ActiveRecord::ConnectionAdapters::ConnectionManagement
run API
