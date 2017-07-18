# frozen_string_literal: true

module V1
  module Helpers
    module JSONAPIHelpers
      extend Grape::API::Helpers

      def check_accept_header!
        if request.headers["Accept"] != V1::Constants::CONTENT_TYPE
          error!("Unsupported Media Type", 415)
        end
      end

      def return_error!(message, status, e = nil)
        error = { title: message, status: status }
        if Rails.env.development? && e.present?
          error[:description] = e.message
          error[:backtrace] = e.backtrace
        end
        error!({ errors: [error] }, status)
      end

      def render_options
        return {} if params[:include].nil?
        { include: params[:include].split(",") }
      end
    end
  end
end
