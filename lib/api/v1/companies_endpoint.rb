# frozen_string_literal: true

module CETS
  class CompaniesEndpoint < Grape::API
    resource :companies do
      # GET /companies
      desc 'Returns a list of all companies.'
      get '/' do
        CompaniesRepo.all
      end

      # GET /companies/:id
      desc 'Returns a specific company'
      params do
        requires :id, type: Integer, desc: 'Company id.'
      end
      route_param :id do
        get do
          Status.find(params[:id])
        end
      end

    end
  end
end
