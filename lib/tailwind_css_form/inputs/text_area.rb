# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module TextArea
      extend ActiveSupport::Concern
      include Base

      included do
        tailwind_css_field :text_area
      end
    end
  end
end
