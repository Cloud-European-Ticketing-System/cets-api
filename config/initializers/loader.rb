# frozen_string_literal: true

files_to_load = [
  'lib/repository/storage/models/*.rb',
  'lib/repository/*.rb',
  'lib/api/v1/*.rb',
  'lib/api/v1.rb',
  'lib/api/core.rb'
]

Utils.load_files(files_to_load)
