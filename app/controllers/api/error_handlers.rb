# frozen_string_literal: true

module API
  # Global api error handlers. With rollbar notifications
  module ErrorHandlers
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound do |e|
        Rollbar.warning(e)
        return_error!("Record not found", 404)
      end

      rescue_from PG::UniqueViolation do |e|
        Rollbar.warning(e)
        return_error!("Duplicate key value violates unique constraint", 409)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        Rollbar.error(e)
        return_error!(e.message, 400)
      end

      rescue_from :all do |e|
        Rollbar.error(e)
        status = e.try(:status) || 500
        return_error!(e.message, status, e)
      end

      rescue_from ActiveRecord::InvalidForeignKey do |e|
        Rollbar.error(e)
        return_error!("Invalid Foreign Key", 500)
      end

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        Rollbar.error(e)
        return_error!(e.message, 400)
      end

      rescue_from Pundit::NotAuthorizedError do |e|
        Rollbar.error(e)
        return_error!("Action unathorized", 403)
      end
    end
  end
end
