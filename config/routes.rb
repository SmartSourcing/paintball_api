Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tournaments, only: [:index, :show]
      resources :tournament_dates, only: [:index, :show]
      resources :tournament_phases, only: [:index]
      resources :tournament_category_team_standings, only: :index
      resources :fixtures, only: [:index, :show]
    end
  end
end
