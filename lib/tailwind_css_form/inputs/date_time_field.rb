# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module DateTimeField
      extend ActiveSupport::Concern
      include Base

      included do
        tailwind_css_field :datetime_field
      end
    end
  end
end
