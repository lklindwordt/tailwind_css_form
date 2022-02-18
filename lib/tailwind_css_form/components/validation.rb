# frozen_string_literal: true

module TailwindCssForm
  module Components
    module Validation
      extend ActiveSupport::Concern

      private

      def error?(name)
        object.respond_to?(:errors) && !(name.nil? || object.errors[name].empty?)
      end
    end
  end
end