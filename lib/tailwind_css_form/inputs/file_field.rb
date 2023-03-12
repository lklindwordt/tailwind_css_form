# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module FileField
      extend ActiveSupport::Concern
      include Base

      included do
        def file_field_with_tailwind_css(name, options = {})
          options = options.reverse_merge(class: field_classes(name, options))
          field_group_builder(name, options) do
            file_field_without_tailwind_css(name, options)
          end
        end

        tailwind_css_alias :file_field
      end
    end
  end
end
