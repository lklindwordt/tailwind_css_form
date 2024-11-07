# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :InputsCollection
    autoload :CheckBox
    autoload :CollectionCheckBoxes
    autoload :CollectionRadioButtons
    autoload :ColorField
    autoload :ComboboxField
    autoload :DateField
    autoload :DateTimeField
    autoload :EmailField
    autoload :FileField
    autoload :PasswordField
    autoload :RadioButton
    autoload :RichTextArea
    autoload :SelectField
    autoload :TextArea
    autoload :TextField
    autoload :TimeField
  end
end
