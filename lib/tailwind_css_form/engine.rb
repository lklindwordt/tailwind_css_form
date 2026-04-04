# frozen_string_literal: true

require "rails/railtie"

module TailwindCssForm
  class Engine < Rails::Engine
    config.eager_load_namespaces << TailwindCssForm
    config.autoload_paths << File.expand_path("lib", __dir__)

    initializer "tailwind_css_form.assets" do |app|
      app.config.assets.paths << root.join("app/assets/javascripts")
      app.config.assets.precompile += %w[tailwind_css_form/controllers]
    end
  end
end
