module Api
  module V1
    class TournamentsController < ApiController

      # Returns a list of tournaments
      #
      # ==== Examples
      #   curl http://localhost:3000/api/v1/tournaments -H 'Authorization: Token token="e35ac57052b9ec2b0739b87b9309c5d3"'
      #   # => []
      def index
        @tournaments = Tournament.all
      end

      # Returns a list of tournaments
      #
      # ==== Examples
      #   curl http://localhost:3000/api/v1/tournaments/1 -H 'Authorization: Token token="e35ac57052b9ec2b0739b87b9309c5d3"'
      #   # => []
      def show
        @tournament = Tournament.find(params[:id])
      end

      private

      def tournament_params

        params.fetch(:tournament, {})
      end
    end
  end
end
