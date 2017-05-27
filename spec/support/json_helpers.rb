# frozen_string_literal: true

module Spec
  module Support
    module JsonHelpers
      module Methods
        def json
          if last_response.object_id != @last_response_id
            @json = JSON.parse(last_response.body)
            @last_response_id = last_response.object_id
          end

          @json
        end
      end
    end
  end
end
