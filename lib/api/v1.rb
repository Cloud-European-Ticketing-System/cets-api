module CETS
  class V1 < Grape::API
    mount UsersEndpoint
  end
end
