module Api
  module V1
    module Concerns
      module Internacionalization
        extend ActiveSupport::Concern

        included do
          before_action :set_locale
        end

        private

        def set_locale

          I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale || 'en'
        end

        def extract_locale_from_accept_language_header

          if request.env['HTTP_ACCEPT_LANGUAGE'].present?

            parsed_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
          end
        end
      end
    end
  end
end
