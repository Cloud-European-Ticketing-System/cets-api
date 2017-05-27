describe CETS::DevicesEndpoint do
  include Rack::Test::Methods
  include Spec::Support::JsonHelpers::Methods

  describe 'POST /device_scans' do
    it 'creates a device' do
      post 'v1/devices', { token: 'test_token' }
      expect(DeviceScan.count).to eq(1)
    end
  end
end
