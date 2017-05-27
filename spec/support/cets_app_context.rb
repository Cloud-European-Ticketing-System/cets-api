# frozen_string_literal: true

module CETSAppContext
  extend RSpec::SharedContext
  def app
    Rack::Builder.new do
      use Rack::Lint
      run CETS::Core.app
    end
  end
end
