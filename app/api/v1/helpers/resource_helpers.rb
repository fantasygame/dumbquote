# frozen_string_literal: true

module V1
  module Helpers
    module ResourceHelpers
      extend Grape::API::Helpers

      def delete_objects(resource, ids)
        records = resource.find(ids)
        ActiveRecord::Base.transaction do
          records.each(&:destroy)
        end
      end
    end
  end
end
