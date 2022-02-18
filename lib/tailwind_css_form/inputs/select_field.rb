# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module SelectField
      extend ActiveSupport::Concern
      include Base

      included do
        def select_with_tailwind_css(name, choices=nil, options={}, html_options={}, &block)
          html_options = html_options.reverse_merge(class: field_classes(name))
          field_group_builder(name, options) do
            select_without_tailwind_css(name, choices, options, html_options, &block)
          end
        end

        tailwind_css_alias :select
      end
    end
  end
end
