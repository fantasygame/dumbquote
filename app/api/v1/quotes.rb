# frozen_string_literal: true

module V1
  class Quotes < Base
    helpers V1::Helpers::JSONAPIParamsHelpers

    resource :quotes do
      desc "Return all quotes"
      paginate per_page: 10
      params do
        use :json_api_index
      end
      get do
        render paginate Quote.all
      end

      desc "Return a quote"
      params do
        requires :id, type: Integer, desc: "Quote id"
      end
      route_param :id do
        get do
          Quote.find(params[:id])
        end
      end
    end
  end
end
