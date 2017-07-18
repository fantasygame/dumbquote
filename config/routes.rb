Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  root to: "react#index"

  # Grape-specific config
  mount API, at: "/"

  authenticate :user, lambda { |u| u.admin? } do
    mount GrapeSwaggerRails::Engine => "/swagger"
  end
end
