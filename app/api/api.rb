# frozen_string_literal: true

# Base API configuration for all future versions
class API < Grape::API
  prefix :api
  include Grape::Kaminari
  include ErrorHandlers
  helpers AuthHelper

  before { authenticate_user! }
  mount V1::Base

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
