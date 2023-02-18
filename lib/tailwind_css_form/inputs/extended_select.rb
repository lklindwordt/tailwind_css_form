# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module ExtendedSelect
      extend ActiveSupport::Concern
      include Base

      included do
        def extended_select(name, choices = nil, options = {}, html_options = {}, &block)
          html_options = html_options.reverse_merge(class: field_classes(name, options))
          field_group_builder(name, options) do
            'wusa'
          end
        end

      end
    end
  end
end