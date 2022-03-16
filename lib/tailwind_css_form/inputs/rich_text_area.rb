# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module RichTextArea
      extend ActiveSupport::Concern
      include Base

      included do
        def rich_text_area_with_tailwind_css(name, options={})
          options[:class] = ["trix-content min-h-10", options[:class]].compact.join(" ")
          field_group_builder(name, options) do
            rich_text_area_without_tailwind_css(name, options)
          end
        end

        tailwind_css_alias :rich_text_area
      end
    end
  end
end