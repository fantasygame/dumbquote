# frozen_string_literal: true

module API
  # Core API configuration for all future versions
  class Core < Grape::API
    prefix :api
    include Grape::Kaminari
    include ErrorHandlers
    helpers AuthHelper

    # before { authenticate_user! } # FIXME disabled until it is handled in clients well
    mount API::V1::Base

    add_swagger_documentation \
      mount_path: "/docs",
      produces: "application/vnd.api+json",
      info: {
        title: "Dumbquote API.",
        description: "Dumbquote API",
        contact_name: "Dumbquote team",
        contact_email: "uro@fantasygame.pl",
      }
  end
end
