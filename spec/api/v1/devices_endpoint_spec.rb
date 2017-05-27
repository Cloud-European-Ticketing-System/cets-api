describe CETS::DevicesEndpoint do
  include Rack::Test::Methods
  include Spec::Support::JsonHelpers::Methods

  describe 'POST /devices' do
    it 'creates a device' do
      post 'v1/devices', {
        type:           'Test Device',
        token:          'Test Token',
        user_id:        1
      }

      expect(Device.count).to eq(1)
    end
  end
end
