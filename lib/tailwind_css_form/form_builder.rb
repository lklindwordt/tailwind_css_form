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
    include TailwindCssForm::Inputs::ComboboxField
    include TailwindCssForm::Inputs::DateField
    include TailwindCssForm::Inputs::EmailField
    include TailwindCssForm::Inputs::FileField
    include TailwindCssForm::Inputs::PasswordField
    include TailwindCssForm::Inputs::RichTextArea
    include TailwindCssForm::Inputs::SelectField
    include TailwindCssForm::Inputs::TextArea
    include TailwindCssForm::Inputs::TextField
    include TailwindCssForm::Inputs::TimeField

    delegate :concat, :tag, :content_tag, :capture, to: :@template

    def field_options(name, options)
      opts = options.except(:group, :wrapper)
      opts[:class] = field_classes(name, opts)
      opts[:aria] = { invalid: true, describedby: "#{name}-error" } if error?(name)

      opts
    end

    def field_classes(name, options)
      classes = []
      classes.concat TailwindCssForm.config.field_classes

      if error?(name)
        classes.concat TailwindCssForm.config.field_error_classes
      else
        classes.concat TailwindCssForm.config.field_regular_classes
      end
      classes.concat TailwindCssForm.config.field_disabled_classes if options[:disabled]
      classes.concat options[:class].split if options&.key?(:class)

      classes.join(" ")
    end
  end
end
