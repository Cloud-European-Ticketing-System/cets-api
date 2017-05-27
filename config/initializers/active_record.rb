# frozen_string_literal: true

require 'active_record'

ActiveRecord::Base.configurations = YAML.safe_load(File.open("#{API_ROOT}/config/database.yml"))
ActiveRecord::Base.establish_connection(API_ENV.to_sym)
