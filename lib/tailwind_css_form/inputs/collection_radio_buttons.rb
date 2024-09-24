# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module CollectionRadioButtons
      extend ActiveSupport::Concern
      include Base

      included do
        def collection_radio_buttons_with_tailwind_css(*args)
          html = inputs_collection(*args) do |name, value, options|
            options[:multiple] = true
            options[:group] = { class: TailwindCssForm.config.collection_check_boxes_classes.join(" ") }
            check_box(name, options, value, nil)
          end
          hidden_field(args.first, value: "", multiple: true).concat(html)
        end

        tailwind_css_alias :collection_radio_buttons
      end
    end
  end
end