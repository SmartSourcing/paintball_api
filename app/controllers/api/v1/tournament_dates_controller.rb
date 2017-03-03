module Api
  module V1
    class TournamentDatesController < ApiController

      # Returns a list of tournament dates belong to a tournament
      #
      # ==== Examples
      #   curl http://localhost:3000/api/v1/tournament_dates?tournament_id=1 -H 'Authorization: Token token="e35ac57052b9ec2b0739b87b9309c5d3"'
      #   # => []
      def index
        @tournament_dates = Tournament.where(id: params[:tournament_id]).first.try(:tournament_dates)
      end

      # Returns a given tournament_date
      #
      # ==== Examples
      #   curl http://localhost:3000/api/v1/tournament_dates/1 -H 'Authorization: Token token="e35ac57052b9ec2b0739b87b9309c5d3"'
      #   # => []
      def show
        @tournament_date = TournamentDate.find(params[:id])
      end

      private

      def tournament_date_params
        params.fetch(:tournament_date, {})
      end
    end
  end
end
