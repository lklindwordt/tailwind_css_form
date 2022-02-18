# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module PasswordField
      extend ActiveSupport::Concern
      include Base

      included do
        tailwind_css_field :password_field
      end
    end
  end
end
