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
    include TailwindCssForm::Inputs::SelectField
    include TailwindCssForm::Inputs::TextField

    delegate :concat, :tag, :content_tag, :capture, to: :@template

    def button_classes
      "flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-sky-800 hover:bg-cyan-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cayn-600"
    end

    def field_options(name, options)
      opts = options
      opts[:class] = field_classes(name)
      opts[:aria] = { invalid: true, describedby: "#{name}-error" } if error?(name)

      opts
    end

    def field_classes(name)
      classes = "appearance-none block w-full h-10 px-3 py-2 border rounded-md shadow-sm focus:outline-none sm:text-sm".split

      if error?(name)
        classes.concat %w[border-red-300 placeholder-gray-400 focus:ring-red-500 focus:border-red-500 pr-10]
      else
        classes.concat %w[border-gray-300 placeholder-gray-400 focus:ring-cyan-600 focus:border-cyan-600]
      end

      classes.flatten.compact.join(" ")
    end
  end
end
