# frozen_string_literal: true

module API
  module V1
    module Helpers
      module ResourceHelpers
        extend Grape::API::Helpers

        # Helper for deleting multiple records at a time from api
        # @returns [void]
        def delete_objects(resource, ids)
          records = resource.find(ids)
          ActiveRecord::Base.transaction do
            records.each(&:destroy)
          end
        end
      end
    end
  end
end
