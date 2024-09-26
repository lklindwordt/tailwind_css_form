# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module RadioButton
      extend ActiveSupport::Concern
      include Base

      included do
        def radio_button_with_tailwind_css(name, option, options = {})
          field_group_builder(name, radio_button_group_opts(options)) do
            html = radio_button_without_tailwind_css(name, option, radio_button_opts(options))
            html.concat(radio_button_label(name, { label: { text: option_text(option, options) } }))
            html
          end
        end

        tailwind_css_alias :radio_button
      end

      private

      def radio_button_opts(options)
        # opts = options.except(:group, :wrapper)
        pp "RADIO BUTTON OPTS"
        pp options
        opts = options.slice(:data)
        opts[:class] = TailwindCssForm.config.radio_button_classes.join(" ")

        pp opts
        opts
      end

      def radio_button_group_opts(options)
        options.merge({
                        wrapper: { class: TailwindCssForm.config.radio_button_wrapper_classes.join(" ") }
                      })
      end

      def option_text(option, options)
        return options[:option][:text] if options.key?(:option) && options[:option].key?(:text)

        option
      end

      def radio_button_label(name, options)
        generate_label(name, options[:label])
      end
    end
  end
end
