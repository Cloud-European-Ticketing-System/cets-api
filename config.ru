# Boot
require_relative('config/boot')

# Some ActiveRecord required crap
use ActiveRecord::ConnectionAdapters::ConnectionManagement

require 'rack/cors'
# Required for swagger online view
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [ :get, :post, :put, :delete ]
  end
end

use Rack::Static,
    urls: ['/swagger/'],
    root: 'public',
    index: 'index.html'

use Rack::Static,
    urls: ['/swagger/'],
    root: 'public'

# Then run the API
run CETS::Core
