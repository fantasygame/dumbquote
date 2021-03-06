# frozen_string_literal: true

module API
  module V1
    module Helpers
      # Helpers for JSON API
      module JSONAPIHelpers
        extend Grape::API::Helpers

        # JSON 415 error response on unsupporded media type
        # @return [void]
        def check_accept_header!
          if request.headers["Accept"] != V1::Constants::CONTENT_TYPE
            error!("Unsupported Media Type", 415)
          end
        end

        # Helper for returning error response
        # Include error description and backtrace only in development
        # @return [void]
        def return_error!(message, status, e = nil)
          error = { title: message, status: status }
          if Rails.env.development? && e.present?
            error[:description] = e.message
            error[:backtrace] = e.backtrace
          end
          error!({ errors: [error] }, status)
        end

        # Helper for returning included associations on response render
        # @return [Hash] including association for JSON API render
        def render_options
          return {} if params[:include].nil?
          { include: params[:include].split(",") }
        end
      end
    end
  end
end
