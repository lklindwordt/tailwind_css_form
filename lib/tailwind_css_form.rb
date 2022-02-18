# frozen_string_literal: true

require "tailwind_css_form/version"
require "action_view"
require "action_pack"
require "tailwind_css_form/action_view_extensions/form_helper"

module TailwindCssForm
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :FormBuilder
    autoload :FieldGroup
    autoload :FieldGroupBuilder
    autoload :Components
    # autoload :Configuration
    autoload :Helpers
    autoload :Inputs
  end

  class << self
    def eager_load!
      Rails.logger.debug "TailwindCssForm::eager_load!"
      super
      TailwindCssForm::Components.eager_load!
      TailwindCssForm::Helpers.eager_load!
      TailwindCssForm::Inputs.eager_load!
    end
  end

  mattr_accessor :field_error_proc
  # rubocop:disable Style/ClassVars
  @@field_error_proc = proc do |html_tag, _instance_tag|
    html_tag
  end
  # rubocop:enable Style/ClassVars
end

require "tailwind_css_form/engine" if defined?(Rails)
