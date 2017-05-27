# frozen_string_literal: true

API_ENV = ENV['RACK_ENV'] ||= 'test'

require_relative '../config/boot'

Utils.load_files([
 'spec/support/*.rb',
 'spec/factories/*.rb'
])

unless ENV['COVERAGE'] == 'false'
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec/'
    add_filter 'config/'
    add_filter 'public/'
    add_filter 'lib/repository/storage/db'
    add_filter 'bin'
  end
end

RSpec.configure do |config|
  config.before do
    DatabaseCleaner.clean_with :transaction
  end

  config.before(:suite) do
    FactoryGirl.reload
    DatabaseCleaner.clean_with(:truncation)
  end

  config.include CETSAppContext
end
