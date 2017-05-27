describe CETS::CompaniesEndpoint do
  include Rack::Test::Methods
  include Spec::Support::JsonHelpers::Methods

  describe 'POST /device_scans' do
    before do
      FactoryGirl.create(:device)
    end

    it 'creates a device scan' do
      post 'v1/device_scans', { token: 'test_token' }
      expect(DeviceScan.count).to eq(1)
    end
  end
end
