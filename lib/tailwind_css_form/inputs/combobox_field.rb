# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module ComboboxField
      extend ActiveSupport::Concern
      include Base

      included do
        # rubocop:disable Lint/UselessAssignment
        def combobox(name, _choices = nil, options = {}, html_options = {})
          html_options = html_options.reverse_merge(class: field_classes(name, options))
          field_group_builder(name, options) do
            "wusa"
          end
        end
        # rubocop:enable Lint/UselessAssignment
      end
    end
  end
end
