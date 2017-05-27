# frozen_string_literal: true

module CETS
  class V1 < Grape::API
    # version 'v1', using: :header, vendor: 'CETS', strict: true, cascade: false
    version 'v1', using: :path

    mount UsersEndpoint
    mount CompaniesEndpoint
    mount DevicesEndpoint
    mount DeviceScansEndpoint
  end
end
