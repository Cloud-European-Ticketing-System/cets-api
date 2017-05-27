module CETS
  class DevicesEndpoint < Grape::API
    resource :devices do
      desc 'Create a device.'
      params do
        requires :type, type: String, desc: 'Device type (card, phone, etc)'
        requires :token, type: String, desc: 'Device identification token.'
        requires :user_id, type: Integer, desc: 'The user this device belongs to.'
      end
      post do
        DeviceRepo.create(params[:type], params[:token], params[:user_id])
      end
    end
  end
end
