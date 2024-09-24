# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module TimeField
      extend ActiveSupport::Concern
      include Base

      included do
        tailwind_css_field :time_field
      end
    end
  end
end
