# frozen_string_literal: true

class UserResource < JSONAPI::Resource
  attributes :name, :email
end
