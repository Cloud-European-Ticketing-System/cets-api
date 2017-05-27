# frozen_string_literal: true

require 'pathname'
require 'bundler/setup'

API_ENV  = ENV['RACK_ENV'] ||= 'development'                 unless defined?(API_ENV)
API_ROOT = Pathname.new(File.expand_path('../..', __FILE__)) unless defined?(API_ROOT)
API_VERSION = File.read(File.join(API_ROOT, 'version')).gsub(/[\n\r]/, '') unless defined?(API_VERSION)

require_relative 'utils'

# Require all from Gemfile
Bundler.require(:default, API_ENV)

# Initialize app
Utils.run_initializers
