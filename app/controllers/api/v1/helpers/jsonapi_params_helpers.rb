# frozen_string_literal: true

module API
  module V1
    module Helpers
      module JSONAPIParamsHelpers
        extend Grape::API::Helpers

        params :json_api do
          optional :include, type: String, desc: "Include nested resources (delimited with comma)"
        end

        params :json_api_index do
          use :json_api
          optional :filter, type: String, desc: "Query string for resource"
        end
      end
    end
  end
end
