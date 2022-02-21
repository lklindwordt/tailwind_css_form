# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module InputsCollection
      extend ActiveSupport::Concern

      private

      def inputs_collection(name, collection, value, text, options={})
        field_group_builder(name, options) do 
          inputs = ActiveSupport::SafeBuffer.new

          collection.each_with_index do |obj, i|
            input_value = value.respond_to?(:call) ? value.call(obj) : obj.send(value)
            input_options = field_group_collection_input_options(options, text, obj, i, input_value, collection)
            inputs << yield(name, input_value, input_options)
          end

          inputs
        end
      end

      def field_group_collection_input_options(options, text, obj, index, input_value, collection)
        input_options = options.merge(label: text.respond_to?(:call) ? text.call(obj) : obj.send(text))
        if (checked = input_options[:checked])
          input_options[:checked] = field_group_collection_input_checked?(checked, obj, input_value)
        end

        input_options[:error_message] = index == collection.size - 1
        input_options.except!(:class)
        input_options
      end

      def field_group_collection_input_checked?(checked, obj, input_value)
        checked == input_value || Array(checked).try(:include?, input_value) || checked == obj || Array(checked).try(:include?, obj)
      end
    end
  end
end