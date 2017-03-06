module Api
  module V1
    class TournamentCategoryTeamStandingsController < ApiController

      # Returns a list of tournament phases that belong to a tournament date
      #
      # ==== Examples
      #   curl http://localhost:3000/api/v1/tournament_category_team_standings?tounament=1&category=3 -H 'Authorization: Token token="e35ac57052b9ec2b0739b87b9309c5d3"'
      #   # => []
      def index

        t           = Tournament.find(params[:tounament])
        c           = Category.find([params[:category]])
        @standings  = TournamentCategoryTeamStanding.where(tournament: t, category: c)
      end
    end
  end
end
