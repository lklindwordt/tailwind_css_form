# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module EmailField
      extend ActiveSupport::Concern
      include Base

      included do
        tailwind_css_field :email_field
      end
    end
  end
end
