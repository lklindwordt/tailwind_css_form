# frozen_string_literal: true

module TailwindCssForm
  module Helpers
    module TailwindCss
      def button(value = nil, options = {}, &block)
        set_css_classes TailwindCssForm.config.button_classes.join(" "), options
        super
      end

      def submit(name = nil, options = {})
        set_css_classes TailwindCssForm.config.button_classes.join(" "), options
        super
      end

      private

      def set_css_classes(the_class, options = {})
        return if options.key? :class

        if (extra_class = options.delete(:extra_class))
          the_class = "#{the_class} #{extra_class}"
        end
        options[:class] = the_class
      end
    end
  end
end
