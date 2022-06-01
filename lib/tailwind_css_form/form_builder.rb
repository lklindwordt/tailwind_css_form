# frozen_string_literal: true

module TailwindCssForm
  class FormBuilder < ActionView::Helpers::FormBuilder
    include TailwindCssForm::Helpers::TailwindCss

    include TailwindCssForm::FieldGroupBuilder
    include TailwindCssForm::FieldGroup
    include TailwindCssForm::Components

    include TailwindCssForm::Inputs::Base
    include TailwindCssForm::Inputs::CheckBox
    include TailwindCssForm::Inputs::CollectionCheckBoxes
    include TailwindCssForm::Inputs::ColorField
    include TailwindCssForm::Inputs::DateField
    include TailwindCssForm::Inputs::EmailField
    include TailwindCssForm::Inputs::PasswordField
    include TailwindCssForm::Inputs::RichTextArea
    include TailwindCssForm::Inputs::SelectField
    include TailwindCssForm::Inputs::TextField

    delegate :concat, :tag, :content_tag, :capture, to: :@template

    def field_options(name, options)
      opts = options
      opts[:class] = field_classes(name)
      opts[:aria] = { invalid: true, describedby: "#{name}-error" } if error?(name)

      opts
    end

    def field_classes(name)
      classes = []
      classes.concat TailwindCssForm.config.field_classes

      if error?(name)
        classes.concat TailwindCssForm.config.field_error_classes
      else
        classes.concat TailwindCssForm.config.field_regular_classes
      end

      classes.join(" ")
    end
  end
end
