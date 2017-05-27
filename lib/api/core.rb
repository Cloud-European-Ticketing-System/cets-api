# frozen_string_literal: true

module CETS
  class Core < Grape::API
    format :json

    # Versioned API
    mount V1

    SWAGGER_INFO = {
      title: 'CETS API',
      description: 'Just your average stuff API'
    }.freeze

    add_swagger_documentation api_version: 'v1',
                              info: SWAGGER_INFO

    def self.app
      Rack::Builder.new do
        run Core
      end
    end
  end
end
