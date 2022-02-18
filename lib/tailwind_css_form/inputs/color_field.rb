# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module ColorField
      extend ActiveSupport::Concern
      include Base

      included do
        tailwind_css_field :color_field
      end
    end
  end
end
