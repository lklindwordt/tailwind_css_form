# frozen_string_literal: true

module TailwindCssForm
  module FieldGroup
    extend ActiveSupport::Concern

    def field_group(method, options, &block)
      tag.div(class: group_classes(options)) do
        field_group_content(
          generate_label(method, options),
          field_wrapper(method, options, &block), 
          method
        )
      end
    end

    def field_group_content(label, wrapper, name)
      concat(label)
      concat(wrapper)
      concat(field_error_message(name)) if error?(name)
    end

    def field_wrapper(method, options, &block)
      tag.div(class: field_wrapper_classes(method)) do 
        concat(capture(&block))
        concat(field_error_icon) if error?(method)
      end
    end

    def group_classes(options)
      return '' unless options.key?(:group) 
      return '' unless options[:group].key?(:class)

      options[:group][:class]
    end

    def field_wrapper_classes(name)
      classes = %w(mt-1).split(' ')
      classes.concat %w(relative rounded-md shadow-sm) if error?(name)

      classes.flatten.compact.join(' ')
    end

    def field_error_icon
      tag.div(class: 'absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none') do
        '<svg class="h-5 w-5 text-red-500" x-description="Heroicon name: solid/exclamation-circle" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
          <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
        </svg>'.html_safe
      end
    end

    def field_error_message(name)
      tag.p(class: 'mt-2 text-sm text-red-600', id: "#{name}-error") do
        "#{object.class.human_attribute_name(name).to_s} #{object.errors[name].first}"
      end
    end
  end
end