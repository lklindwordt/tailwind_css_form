# frozen_string_literal: true

module TailwindCssForm
  module Components
    module Labels
      extend ActiveSupport::Concern

      private

      def generate_label(method, options = {})
        options = {} if options.nil?
        label(method, label_text(method, options), label_options(method, options))
      end

      def label_text(method, options)
        options[:text] || options[:label] || object.class.human_attribute_name(method).to_s
      end

      def label_options(method, options)
        {
          class: label_classes(options)
        }
      end

      def label_classes(options)
        classes = %w(block text-sm font-medium text-gray-700)
        classes << 'hidden' if options[:hide]

        classes
      end
    end
  end
end