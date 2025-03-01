# frozen_string_literal: true

module TailwindCssForm
  module FieldGroup
    extend ActiveSupport::Concern

    def field_group(*args, &block)
      options = args.extract_options!
      method = args.first

      tag.div(class: group_classes(options[:group]), data: group_data(options[:group])) do
        field_group_content(
          generate_label(method, options),
          field_wrapper(method, options[:wrapper], &block),
          method
        )
      end
    end

    def field_group_content(label, wrapper, name)
      concat(label)
      concat(wrapper)
      concat(field_error_message(name)) if error?(name)
    end

    def field_wrapper(method, options = {}, &block)
      tag.div(class: field_wrapper_classes(method, options)) do
        concat(capture(&block))
        concat(field_error_icon) if error?(method)
      end
    end

    def group_classes(options = {})
      return "" unless options&.key?(:class)

      options[:class]
    end

    def group_data(options = {})
      return "" unless options&.key?(:data)

      options[:data]
    end

    def field_wrapper_classes(name, options = {})
      classes = []
      classes.concat TailwindCssForm.config.field_wrapper_classes
      classes.concat TailwindCssForm.config.field_wrapper_error_classes if error?(name)
      classes.concat options[:class].split if options&.key?(:class)

      classes.join(" ")
    end

    # rubocop:disable Layout/LineLength
    def field_error_icon
      tag.div(class: TailwindCssForm.config.field_error_icon_wrapper_classes.join(" ")) do
        "<svg class='#{TailwindCssForm.config.field_error_icon_classes.join(" ")}' x-description='Heroicon name: solid/exclamation-circle' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor' aria-hidden='true'>
          <path fill-rule='evenodd' d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z' clip-rule='evenodd'></path>
        </svg>".html_safe
      end
    end
    # rubocop:enable Layout/LineLength

    def field_error_message(name)
      tag.p(class: TailwindCssForm.config.field_error_message_classes.join(" "), id: "#{name}-error") do
        object.errors[name].first
      end
    end
  end
end
