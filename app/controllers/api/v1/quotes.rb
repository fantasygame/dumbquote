# frozen_string_literal: true

module API
  module V1
    # Endpoints for groups api
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

        desc "Create new quote"
        params do
          requires :content, type: String, desc: "New quote content"
        end
        post do
          Quote.create!(
            user: User.first,
            content: params[:content],
          )
        end
      end
    end
  end
end
