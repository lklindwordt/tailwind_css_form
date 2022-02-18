# frozen_string_literal: true

module TailwindCssForm
  module ActionViewExtensions
    # This module creates form with TailwindCssForm as builder
    #
    # Example:
    #
    #   tailwind_css_form_for @user do |f|
    #     f.text_field :name
    #   end
    #
    # Example:
    #
    #   tailwind_css_form_for model: @user do |f|
    #     f.text_field :name
    #   end
    module FormHelper
      def tailwind_css_form_for(record, options = {}, &block)
        Rails.logger.debug "TailwindCssForm::ActionViewExtensions::FormHelper#tailwind_css_form_for"
        options.reverse_merge!(builder: TailwindCssForm::FormBuilder)

        with_tailwind_css_form_field_error_proc do
          form_for(record, options, &block)
        end
      end

      def tailwind_css_form_with(options = {}, &block)
        Rails.logger.debug "TailwindCssForm::ActionViewExtensions::FormHelper#tailwind_css_form_with"
        options.reverse_merge!(builder: TailwindCssForm::FormBuilder)

        with_tailwind_css_form_field_error_proc do
          form_with(**options, &block)
        end
      end

      private

      def with_tailwind_css_form_field_error_proc
        original_proc = ActionView::Base.field_error_proc
        ActionView::Base.field_error_proc = TailwindCssForm.field_error_proc
        yield
      ensure
        ActionView::Base.field_error_proc = original_proc
      end
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include TailwindCssForm::ActionViewExtensions::FormHelper
end
