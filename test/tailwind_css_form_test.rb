# frozen_string_literal: true

require_relative "test_helper"

class TailwindCssFormTest < Minitest::Test
  def test_has_version_number
    refute_nil TailwindCssForm::VERSION
  end

  def test_version_is_string
    assert_kind_of String, TailwindCssForm::VERSION
  end

  def test_module_has_config_method
    assert_respond_to TailwindCssForm, :config
  end

  def test_module_has_configure_method
    assert_respond_to TailwindCssForm, :configure
  end

  def test_config_returns_configuration_instance
    assert_kind_of TailwindCssForm::Configuration, TailwindCssForm.config
  end

  def test_configure_yields_config
    TailwindCssForm.configure do |config|
      assert_kind_of TailwindCssForm::Configuration, config
    end
  end

  def test_has_field_error_proc
    assert_respond_to TailwindCssForm, :field_error_proc
  end

  def test_field_error_proc_is_a_proc
    assert_kind_of Proc, TailwindCssForm.field_error_proc
  end

  def test_field_error_proc_returns_html_tag
    html_tag = "<div>Test</div>"
    result = TailwindCssForm.field_error_proc.call(html_tag, nil)
    assert_equal html_tag, result
  end
end

class TailwindCssFormIntegrationTest < Minitest::Test
  def setup
    @builder = form_builder
    reset_config
    TailwindCssForm.configure do |config|
      config.field_classes = %w[rounded border px-3 py-2]
      config.field_regular_classes = %w[border-gray-300]
      config.field_error_classes = %w[border-red-500]
      config.button_classes = %w[btn btn-primary]
    end
  end

  def teardown
    reset_config
  end

  def test_text_field_renders_with_all_components
    result = @builder.text_field(:name)

    # Has label
    assert_match(/<label/, result)
    assert_match(/Name/, result)

    # Has input
    assert_match(/type="text"/, result)
    assert_match(/name="user\[name\]"/, result)

    # Has configured classes
    assert_match(/rounded/, result)
    assert_match(/border/, result)
    assert_match(/border-gray-300/, result)
  end

  def test_form_with_errors_shows_validation
    builder_with_errors = form_builder(user_with_errors)
    result = builder_with_errors.text_field(:name)

    # Has error classes
    assert_match(/border-red-500/, result)

    # Has aria attributes
    assert_match(/aria-invalid="true"/, result)

    # Has error message
    assert_match(/can&#39;t be blank/, result)
  end

  def test_complete_form_workflow
    # email_field correctly uses type="email" from Rails
    result = @builder.email_field(:email, placeholder: "you@example.com")

    # Label
    assert_match(/Email/, result)

    # Input with correct email type
    assert_match(/type="email"/, result)

    # Placeholder
    assert_match(/placeholder="you@example.com"/, result)

    # Classes
    assert_match(/rounded/, result)
    assert_match(/border-gray-300/, result)
  end

  def test_button_with_configured_classes
    result = @builder.submit("Create User")

    assert_match(/btn/, result)
    assert_match(/btn-primary/, result)
    assert_match(/Create User/, result)
  end

  def test_select_with_options
    result = @builder.select(:country, [%w[USA us], %w[Canada ca]], {}, {})

    assert_match(/<select/, result)
    assert_match(/USA/, result)
    assert_match(/Canada/, result)
    assert_match(/rounded/, result)
  end

  def test_checkbox_with_label
    TailwindCssForm.configure do |config|
      config.check_box_classes = %w[rounded]
      config.check_box_wrapper_classes = %w[flex items-center]
      config.check_box_group_classes = %w[space-y-2]
      config.check_box_label_wrapper_classes = %w[ml-2]
    end

    result = @builder.check_box(:active)

    assert_match(/type="checkbox"/, result)
    assert_match(/Active/, result)
    assert_match(/rounded/, result)
  end

  def test_combobox_complete_rendering
    choices = [
      { id: 1, name: "Admin" },
      { id: 2, name: "User" }
    ]
    result = @builder.combobox(:role, choices, 1)

    # Has hidden input
    assert_match(/type="hidden"/, result)

    # Has button
    assert_match(/<button/, result)

    # Has list
    assert_match(/<ul/, result)

    # Has Stimulus controller
    assert_match(/data-controller="combobox"/, result)

    # Has all choices
    assert_match(/Admin/, result)
    assert_match(/User/, result)
  end
end
