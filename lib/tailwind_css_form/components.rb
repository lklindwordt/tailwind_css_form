# frozen_string_literal: true

module TailwindCssForm
  module Components
    extend ActiveSupport::Autoload

    autoload :Labels
    autoload :Validation

    include Labels
    include Validation
  end
end
