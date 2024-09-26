# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module CollectionRadioButtons
      extend ActiveSupport::Concern
      include Base

      included do
        def collection_radio_buttons_with_tailwind_css(*args)
          html = inputs_collection(*args) do |name, value, options|
            radio_button(name, value, collection_radio_button_opts(options))
          end
        end

        tailwind_css_alias :collection_radio_buttons
      end

      private

      def collection_radio_button_opts(options)
        {
          label: { hide: true }, option: { text: options[:label] },
          data: options[:data] || {}
        }
      end
    end
  end
end
