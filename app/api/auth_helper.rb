# frozen_string_literal: true

require "doorkeeper/grape/helpers"

# Helpers for api authentication
module AuthHelper
  extend ::Grape::API::Helpers
  include Doorkeeper::Grape::Helpers

  APPLICATION = "application"

  def authenticate_user!
    unathorized_error unless authenticated?
  end

  def authenticated?
    return true if warden.authenticate(scope: :user)
    doorkeeper_token.present? ? doorkeeper_authorize!.nil? : unathorized_error
  end

  def unathorized_error
    error!("401 Unauthorized", 401)
  end

  def current_requester
    return APPLICATION if doorkeeper_token && doorkeeper_token.resource_owner_id.nil?
    current_user
  end

  def current_user
    user = doorkeeper_token.present? ? doorkeeper_user : warden.authenticate(scope: :user)
    authenticated? && user
  end

  def doorkeeper_user
    if doorkeeper_token.resource_owner_id
      User.find(doorkeeper_token.resource_owner_id)
    else
      User.app.new
    end
  end

  def warden
    env["warden"]
  end
end
