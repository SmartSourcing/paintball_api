module Api
  module V1
    class ApiController < ApplicationController
      include ActionController::MimeResponds
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include Api::V1::Concerns::ErrorHandler
      include Api::V1::Concerns::Internacionalization

      before_action :check_security   unless Rails.env == 'development'
      before_action :cors_set_headers if Rails.env == 'development'

      private

      def cors_set_headers

        headers['Access-Control-Allow-Origin']  = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      end

      def check_security

        authenticate_or_request_with_http_token do |token, options|

          @token = Token.find_by_token(token)
        end
      end

      def current_ability
        @current_ability ||= Ability.new(current_token)
      end

      def current_token
        @token || Token.first #<--- TODO: create a permissionless token for this situation
      end
    end
  end
end
