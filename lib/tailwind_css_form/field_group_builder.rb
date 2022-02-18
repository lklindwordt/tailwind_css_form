# frozen_string_literal: true

module TailwindCssForm
  module FieldGroupBuilder
    extend ActiveSupport::Concern

    private

    def field_group_builder(method, options, html_options=nil, &block)
      field_group(method, options, &block)
    end
  end
end