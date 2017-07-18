# frozen_string_literal: true

module V1
  # Base API configuration for V1, JSON API
  class Base < API
    helpers V1::Helpers::JSONAPIHelpers
    helpers V1::Helpers::ResourceHelpers

    before { check_accept_header! }

    version "v1", using: :path, vendor: "dumbquote"
    format :json
    use GrapeLogging::Middleware::RequestLogger, logger: logger
    formatter :json, Grape::Formatter::JSONAPIResources
    content_type :json, V1::Constants::CONTENT_TYPE

    mount Users
  end
end
