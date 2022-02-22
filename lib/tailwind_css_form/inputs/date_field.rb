# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module DateField
      extend ActiveSupport::Concern
      include Base

      included do
        tailwind_css_field :date_field
      end
    end
  end
end
