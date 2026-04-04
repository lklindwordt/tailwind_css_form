# frozen_string_literal: true

require_relative "test_helper"

class LabelsComponentTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_generate_label_creates_label_element
    result = @builder.send(:generate_label, :name)
    assert_match(/<label/, result)
  end

  def test_label_includes_field_name_humanized
    result = @builder.send(:generate_label, :name)
    assert_match(/Name/, result)
  end

  def test_label_with_custom_text_option
    result = @builder.send(:generate_label, :name, label: "Full Name")
    assert_match(/Full Name/, result)
  end

  def test_label_with_text_in_hash
    # The label_text method expects { text: "..." } not just a hash at the top level
    result = @builder.send(:label_text, :name, { text: "Custom Name" })
    assert_equal "Custom Name", result
  end

  def test_label_includes_default_classes
    result = @builder.send(:generate_label, :name)
    assert_match(/block/, result)
    assert_match(/text-sm/, result)
    assert_match(/font-medium/, result)
    assert_match(/text-gray-700/, result)
  end

  def test_label_can_be_hidden
    # The hide option needs to be inside the label hash
    result = @builder.send(:generate_label, :name, label: { hide: true })
    assert_match(/hidden/, result)
  end

  def test_label_text_from_string
    result = @builder.send(:label_text, :name, "Simple Label")
    assert_equal "Simple Label", result
  end

  def test_label_text_from_hash_with_text_key
    result = @builder.send(:label_text, :name, { text: "Label Text" })
    assert_equal "Label Text", result
  end

  def test_label_text_from_hash_with_label_key
    result = @builder.send(:label_text, :name, { label: "Label Key Text" })
    assert_equal "Label Key Text", result
  end

  def test_label_text_humanized_from_attribute
    result = @builder.send(:label_text, :email, {})
    assert_equal "Email", result
  end
end

class ValidationComponentTest < Minitest::Test
  def setup
    @builder = form_builder
    @builder_with_errors = form_builder(user_with_errors)
  end

  def test_error_returns_false_for_valid_field
    refute @builder.send(:error?, :name)
  end

  def test_error_returns_true_for_invalid_field
    assert @builder_with_errors.send(:error?, :name)
  end

  def test_error_returns_false_for_nil_field_name
    refute @builder.send(:error?, nil)
  end

  def test_error_returns_false_when_object_has_no_errors_method
    builder = form_builder(Object.new)
    refute builder.send(:error?, :anything)
  end

  def test_error_returns_true_for_email_field_with_error
    assert @builder_with_errors.send(:error?, :email)
  end

  def test_error_returns_false_for_field_without_error
    refute @builder_with_errors.send(:error?, :bio)
  end
end

class HelpersTest < Minitest::Test
  def setup
    @builder = form_builder
    TailwindCssForm.configure do |config|
      config.button_classes = %w[btn btn-primary]
    end
  end

  def teardown
    reset_config
  end

  def test_button_includes_configured_classes
    result = @builder.button("Click me")
    assert_match(/btn/, result)
    assert_match(/btn-primary/, result)
  end

  def test_submit_includes_configured_classes
    result = @builder.submit("Save")
    assert_match(/btn/, result)
    assert_match(/btn-primary/, result)
  end

  def test_button_with_custom_class_option
    result = @builder.button("Click me", class: "custom-button")
    assert_match(/custom-button/, result)
    refute_match(/btn-primary/, result)
  end

  def test_submit_with_custom_class_option
    result = @builder.submit("Save", class: "custom-submit")
    assert_match(/custom-submit/, result)
    refute_match(/btn-primary/, result)
  end

  def test_button_with_extra_class_option
    result = @builder.button("Click me", extra_class: "extra")
    assert_match(/btn/, result)
    assert_match(/btn-primary/, result)
    assert_match(/extra/, result)
  end

  def test_submit_with_extra_class_option
    result = @builder.submit("Save", extra_class: "extra-submit")
    assert_match(/btn/, result)
    assert_match(/btn-primary/, result)
    assert_match(/extra-submit/, result)
  end

  def test_button_with_block
    result = @builder.button do
      "Button Content"
    end
    assert_match(/Button Content/, result)
  end

  def test_submit_default_value
    result = @builder.submit
    assert_match(/type="submit"/, result)
  end
end

class FieldGroupBuilderTest < Minitest::Test
  def setup
    @builder = form_builder
    TailwindCssForm.configure do |config|
      config.field_wrapper_classes = %w[field-wrapper]
      config.field_wrapper_error_classes = %w[field-wrapper-error]
      config.field_error_message_classes = %w[error-message]
    end
  end

  def teardown
    reset_config
  end

  def test_field_group_builder_wraps_content
    result = @builder.send(:field_group_builder, :name, {}) do
      "Field Content"
    end
    assert_match(/Field Content/, result)
  end

  def test_field_group_includes_wrapper_classes
    result = @builder.send(:field_group_builder, :name, {}) do
      "Field Content"
    end
    assert_match(/field-wrapper/, result)
  end

  def test_field_group_includes_label
    result = @builder.send(:field_group_builder, :name, {}) do
      "Field Content"
    end
    assert_match(/<label/, result)
    assert_match(/Name/, result)
  end

  def test_field_group_with_hidden_label
    result = @builder.send(:field_group_builder, :name, { label: { hide: true } }) do
      "Field Content"
    end
    assert_match(/hidden/, result)
  end

  def test_field_group_shows_errors_for_invalid_fields
    builder_with_errors = form_builder(user_with_errors)
    result = builder_with_errors.send(:field_group_builder, :name, {}) do
      "Field Content"
    end
    assert_match(/error-message/, result)
    assert_match(/can&#39;t be blank/, result)
  end

  def test_field_group_with_custom_wrapper_classes
    result = @builder.send(:field_group_builder, :name, { wrapper: { class: "custom-wrapper" } }) do
      "Field Content"
    end
    assert_match(/custom-wrapper/, result)
  end
end
