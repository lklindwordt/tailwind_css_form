# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :CheckBox
    autoload :ColorField
    autoload :EmailField
    autoload :PasswordField
    autoload :SelectField
    autoload :TextField
  end
end
