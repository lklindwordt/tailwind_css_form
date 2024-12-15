# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module CheckBox
      extend ActiveSupport::Concern
      include Base

      included do
        def check_box_with_tailwind_css(name, options = {}, checked_value = "1", unchecked_value = "0")
          tag.div(class: check_box_group_class(options[:group])) do
            html = check_box_builder(name, options, checked_value, unchecked_value)
            html.concat(check_box_label(name, options))
            html
          end
        end

        tailwind_css_alias :check_box
      end

      private

      def check_box_builder(name, options, checked_value, unchecked_value)
        tag.div(class: TailwindCssForm.config.check_box_wrapper_classes.join(" ")) do
          check_box_without_tailwind_css(name, check_box_options(options), checked_value, unchecked_value)
        end
      end

      def check_box_options(options)
        classes = []
        classes.concat TailwindCssForm.config.check_box_classes
        classes.concat options[:class].split if options.key?(:class)
        
        options[:class] = classes.join(" ")
        options
      end

      def check_box_label(name, options)
        tag.div(class: TailwindCssForm.config.check_box_label_wrapper_classes.join(" ")) do
          generate_label(name, options)
        end
      end

      def check_box_group_class(options)
        options = {} if options.nil?
        classes = TailwindCssForm.config.check_box_group_classes
        classes << options[:class] if options.key?(:class)
        classes.uniq
      end
    end
  end
end
