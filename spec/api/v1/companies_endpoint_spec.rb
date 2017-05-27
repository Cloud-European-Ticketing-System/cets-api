describe CETS::CompaniesEndpoint do
  include Rack::Test::Methods
  include Spec::Support::JsonHelpers::Methods

  describe 'GET /companies' do
    context 'when no companies are registered' do
      it 'returns an empty json' do
        get 'v1/companies'
        expect(last_response.status).to eq(200)
        expect(json.size).to eq(0)
      end
    end

    context 'when companies are registered' do
      before do
        3.times do |i|
          FactoryGirl.create(:company, name: "Company Name #{i + 1}")
        end
        get 'v1/companies'
      end

      it 'returns a list of companies' do
        expect(last_response.status).to eq(200)
        expect(json.size).to eq(3)
        expect(json[0]["name"]).to eq 'Company Name 1'
      end
    end
  end

  describe 'GET /companies/id' do

  end
end
