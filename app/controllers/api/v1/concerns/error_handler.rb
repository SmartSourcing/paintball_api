module Api
  module V1
    module Concerns
      module ErrorHandler
        extend ActiveSupport::Concern

        included do

          rescue_from Exception do |error|
            handle_exception error
          end
        end

        protected

        def handle_exception(error=nil)
          case error
            when ActiveRecord::RecordNotFound

              render json: I18n.t('api.not_found'), status: 401
            else

              render json: { message: error.try(:message) }, status: error.try(:status) || 500
          end
        end
      end
    end
  end
end
