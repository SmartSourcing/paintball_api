module Api
  module V1
    class TournamentPhaseController < ApiController

      # Returns a list of tournament phases that belong to a tournament date
      #
      # ==== Examples
      #   curl http://localhost:3000/api/v1/tournament_phases?date=1 -H 'Authorization: Token token="e35ac57052b9ec2b0739b87b9309c5d3"'
      #   # => []
      def index
        tournament_date = TournamentDate.find(params[:date])
        @phases         = TournamentPhase.where(tournament_date: tournament_date)
      end
    end
  end
end
