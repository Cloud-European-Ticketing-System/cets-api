# frozen_string_literal: true

require 'pathname'
require 'bundler/setup'
require_relative 'utils'

API_ENV  = ENV['RACK_ENV'] ||= 'development'                 unless defined?(API_ENV)
API_ROOT = Pathname.new(File.expand_path('../..', __FILE__)) unless defined?(API_ROOT)
API_VERSION = File.read(File.join(API_ROOT, 'version')).gsub(/[\n\r]/, '') unless defined?(API_VERSION)

# Require all from Gemfile
Bundler.require(:default, API_ENV)
require 'active_record'

files_to_load = [
  'lib/api/v1/*.rb',
  'lib/api/v1.rb',
  'lib/api/core.rb'
]

Utils.load_files(files_to_load)
