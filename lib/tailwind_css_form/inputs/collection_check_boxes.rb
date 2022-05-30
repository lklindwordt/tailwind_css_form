# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module CollectionCheckBoxes
      extend ActiveSupport::Concern
      include Base
      include InputsCollection

      included do
        def collection_check_boxes_with_tailwind_css(*args)
          html = inputs_collection(*args) do |name, value, options|
            options[:multiple] = true
            options[:group] = { class: TailwindCssForm.config.collection_check_boxes_classes.join(" ") }
            check_box(name, options, value, nil)
          end
          hidden_field(args.first, value: "", multiple: true).concat(html)
        end

        tailwind_css_alias :collection_check_boxes
      end
    end
  end
end
