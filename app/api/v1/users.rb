# frozen_string_literal: true

module V1
  class Users < Base
    helpers V1::Helpers::JSONAPIParamsHelpers

    resource :users do
      desc "Return all users"
      paginate per_page: 10
      params do
        use :json_api_index
      end
      get do
        render paginate User.all
      end

      desc "Return a user"
      params do
        requires :id, type: Integer, desc: "User id"
      end
      route_param :id do
        get do
          User.find(params[:id])
        end
      end
    end
  end
end
