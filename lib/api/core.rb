module CETS
  class Core < Grape::API
    # version 'v1', using: :header, vendor: 'CETS', strict: true, cascade: false
    version 'v1', using: :path
    mount V1

    SWAGGER_INFO = {
      title: 'CETS API',
      description: 'Just your average stuff API'
    }.freeze

    add_swagger_documentation api_version: 'v1',
                              info: SWAGGER_INFO
  end
end
