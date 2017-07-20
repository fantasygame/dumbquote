# frozen_string_literal: true

require "doorkeeper/grape/helpers"

# Helpers for api authentication
module API
  module AuthHelper
    extend ::Grape::API::Helpers
    include Doorkeeper::Grape::Helpers

    APPLICATION = "application"

    # JSON unauthorized response on unauthenticated user
    # @return [void]
    def authenticate_user!
      unathorized_error unless authenticated?
    end

    # Check if user is authenticated by warden (devise) or by doorkeeper token
    # @return [Boolean]
    def authenticated?
      return true if warden.authenticate(scope: :user)
      doorkeeper_token.present? ? doorkeeper_authorize!.nil? : false
    end

    # Unathorized error json response
    # @return [Boolean]
    def unathorized_error
      error!("401 Unauthorized", 401)
    end

    # Current requester
    # @return [{User}, String]
    def current_requester
      return APPLICATION if doorkeeper_token && doorkeeper_token.resource_owner_id.nil?
      current_user
    end

    # Current user
    # @return [{User}, nil]
    def current_user
      user = doorkeeper_token.present? ? doorkeeper_user : warden.authenticate(scope: :user)
      authenticated? && user
    end

    # User from doorkeeper token or new user
    # @return [{User}]
    def doorkeeper_user
      if doorkeeper_token.resource_owner_id
        User.find(doorkeeper_token.resource_owner_id)
      else
        User.user.new
      end
    end

    # Warden object from env
    # @return [Warden::Proxy]
    def warden
      env["warden"]
    end
  end
end
