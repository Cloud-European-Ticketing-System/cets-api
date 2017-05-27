# frozen_string_literal: true

require_relative 'config/boot'

STORAGE_PATH = "#{API_ROOT}/lib/repository/storage"

namespace :db do
  db_config       = YAML.safe_load(File.open("#{API_ROOT}/config/database.yml"))
  db_config       = db_config[API_ENV]
  db_config_no_database = db_config.clone
  db_config_no_database.delete('database')

  desc 'Create the database'
  task :create do
    ActiveRecord::Base.establish_connection(db_config_no_database)
    ActiveRecord::Base.connection.create_database(db_config['database'])
    puts 'Database created.'
  end

  desc 'Migrate the database'
  task :migrate do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::Migrator.migrate("#{STORAGE_PATH}/db/migrate/")
    Rake::Task['db:schema'].invoke
    puts 'Database migrated.'
  end

  desc 'Drop the database'
  task :drop do
    ActiveRecord::Base.establish_connection(db_config_no_database)
    ActiveRecord::Base.connection.drop_database(db_config['database'])
    puts 'Database deleted.'
  end

  desc 'Reset the database'
  task reset: %i[drop create migrate]

  desc 'Create a db/schema.rb file that is portable against any DB supported by AR'
  task :schema do
    ActiveRecord::Base.establish_connection(db_config)
    require 'active_record/schema_dumper'
    filename = "#{STORAGE_PATH}/db/schema.rb"
    File.open(filename, 'w:utf-8') do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end
end

namespace :g do
  desc 'Generate migration'
  task :migration do
    name = ARGV[1] || raise('Specify name: rake g:migration your_migration')
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    path = "#{STORAGE_PATH}/db/migrate/#{timestamp}_#{name}.rb"
    migration_class = name.split('_').map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<~EOF
        class #{migration_class} < ActiveRecord::Migration
          def self.up
          end
          def self.down
          end
        end
      EOF
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end
