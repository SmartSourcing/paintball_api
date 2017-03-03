Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tournaments, only: [:index, :show]
      resources :tournament_dates, only: [:index, :show]
    end
  end
end
