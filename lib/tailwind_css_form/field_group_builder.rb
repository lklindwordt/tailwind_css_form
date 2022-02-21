# frozen_string_literal: true

module TailwindCssForm
  module FieldGroupBuilder
    extend ActiveSupport::Concern

    private

    def field_group_builder(method, options, html_options=nil, &block)
      field_group(method, field_group_opts(options), &block)
    end

    def field_group_opts(options)
      options.merge({
        label: label_opts(options[:label])
      })
    end

    def label_opts(options)
      options = {} if options.nil?
      options.merge({
        text: options&.key?(:text) ? options[:text] : '',
        hide: options&.key?(:hide) ? options[:hide] : false
      })
    end
  end
end