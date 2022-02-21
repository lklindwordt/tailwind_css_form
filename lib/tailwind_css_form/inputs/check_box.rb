# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module CheckBox
      extend ActiveSupport::Concern
      include Base

      included do
        def check_box_with_tailwind_css(name, options={}, checked_value="1", unchecked_value="0", &block)
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
        tag.div(class: 'flex items-center h-5') do
          check_box_without_tailwind_css(name, check_box_options(options), checked_value, unchecked_value)
        end
      end

      def check_box_options(options)
        opts = options
        opts[:class] = 'focus:ring-cyan-600 h-4 w-4 text-cyan-600 border-gray-300 rounded'

        opts
      end

      def check_box_label(name, options)
        tag.div(class: 'ml-3 text-sm') do
          generate_label(name, options)
        end
      end

      def check_box_group_class(options)
        options = {} if options.nil?
        classes = %w(relative flex items-start)
        classes << options[:class].split(' ') if options.key?(:class)
        classes
      end
    end
  end
end