# frozen_string_literal: true

require "rails/railtie"

module TailwindCssForm
  class Engine < Rails::Engine
    config.eager_load_namespaces << TailwindCssForm
    config.autoload_paths << File.expand_path("lib", __dir__)
  end
end
