# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module Base
      extend ActiveSupport::Concern

      class_methods do
        def tailwind_css_field(field_name)
          define_method "#{field_name}_with_tailwind_css" do |name, options = {}|
            field_group_builder(name, options) do
              send("#{field_name}_without_tailwind_css".to_sym, name, field_options(name, options))
            end
          end

          tailwind_css_alias field_name
        end

        def tailwind_css_alias(field_name)
          alias_method "#{field_name}_without_tailwind_css".to_sym, field_name
          alias_method field_name, "#{field_name}_with_tailwind_css".to_sym
        end
      end
    end
  end
end
