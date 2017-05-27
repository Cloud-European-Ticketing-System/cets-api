module CETS
  class UsersEndpoint < Grape::API
    resource :users do
      desc 'Return all fucking users.'
      get '/' do
        { user: 'Fucker' }
      end
    end
  end
end