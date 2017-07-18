# frozen_string_literal: true

class UserResource < JSONAPI::Resource
  attributes :email, :role
end
