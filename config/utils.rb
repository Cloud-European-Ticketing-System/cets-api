# frozen_string_literal: true

module Utils
  ROOT_PATH = API_ROOT
  INI_PATH  = 'config/initializers/*.rb'

  class << self
    def load_files(files = [])
      Dir[*files].uniq.each do |filename|
        require ROOT_PATH.join(filename)
      end
    end

    def run_initializers
      load_files([INI_PATH])
    end
  end
end
