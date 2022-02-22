# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :InputsCollection
    autoload :CheckBox
    autoload :CollectionCheckBoxes
    autoload :ColorField
    autoload :DateField
    autoload :EmailField
    autoload :PasswordField
    autoload :SelectField
    autoload :TextField
  end
end
