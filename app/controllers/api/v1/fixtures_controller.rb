module Api
  module V1
    class FixturesController < ApiController

      # Returns a list of tournament dates belong to a tournament
      #
      # ==== Examples
      #   curl http://localhost:3000/api/v1/fixtures?phase=1 -H 'Authorization: Token token="e35ac57052b9ec2b0739b87b9309c5d3"'
      #   # => []
      def index
        phase     = TournamentPhase.find(params[:phase])
        @fixtures = Fixture.where(tournament_phase_id: phase.id)
      end

      # Returns a given tournament_date
      #
      # ==== Examples
      #   curl http://localhost:3000/api/v1/fixtures/1 -H 'Authorization: Token token="e35ac57052b9ec2b0739b87b9309c5d3"'
      #   # => []
      def show
        @fixture = Fixture.find(params[:id])
      end
    end
  end
end
