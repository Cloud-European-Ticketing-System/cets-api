# frozen_string_literal: true

module CETS
  class DeviceScansEndpoint < Grape::API
    resource :device_scans do
      desc 'Create a device scan entry.'
      params do
        requires :token, type: String, desc: 'Token identifier of the scanned device.'
      end
      post do
        device_id = DeviceRepo.id_by_token(params[:token])
        DeviceScansRepo.create(device_id)
      end
    end
  end
end
