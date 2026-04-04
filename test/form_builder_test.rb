# frozen_string_literal: true

require_relative "test_helper"

class FormBuilderTest < Minitest::Test
  def setup
    @builder = form_builder
    @builder_with_errors = form_builder(user_with_errors)
    TailwindCssForm.configure do |config|
      config.field_classes = %w[base-class]
      config.field_regular_classes = %w[regular-class]
      config.field_error_classes = %w[error-class]
      config.field_disabled_classes = %w[disabled-class]
    end
  end

  def teardown
    reset_config
  end

  def test_field_classes_includes_base_classes
    result = @builder.field_classes(:name, {})
    assert_includes result, "base-class"
  end

  def test_field_classes_includes_regular_classes_for_valid_fields
    result = @builder.field_classes(:name, {})
    assert_includes result, "regular-class"
  end

  def test_field_classes_includes_error_classes_for_invalid_fields
    result = @builder_with_errors.field_classes(:name, {})
    assert_includes result, "error-class"
  end

  def test_field_classes_includes_disabled_classes_when_disabled
    result = @builder.field_classes(:name, { disabled: true })
    assert_includes result, "disabled-class"
  end

  def test_field_classes_merges_custom_classes_from_string
    result = @builder.field_classes(:name, { class: "custom-class" })
    assert_includes result, "custom-class"
  end

  def test_field_classes_merges_custom_classes_from_array
    result = @builder.field_classes(:name, { class: %w[class1 class2] })
    assert_includes result, "class1"
    assert_includes result, "class2"
  end

  def test_field_options_includes_class
    options = @builder.field_options(:name, {})
    assert options[:class].present?
  end

  def test_field_options_excludes_group_and_wrapper
    options = @builder.field_options(:name, { group: {}, wrapper: {} })
    refute options.key?(:group)
    refute options.key?(:wrapper)
  end

  def test_field_options_adds_aria_attributes_for_errors
    options = @builder_with_errors.field_options(:name, {})
    assert_equal true, options[:aria][:invalid]
    assert_equal "name-error", options[:aria][:describedby]
  end

  def test_field_options_no_aria_for_valid_fields
    options = @builder.field_options(:name, {})
    assert_nil options[:aria]
  end

  def test_includes_tailwind_css_helpers
    # error? is a private method
    assert @builder.respond_to?(:error?, true)
  end

  def test_includes_field_group_builder
    # field_group_builder is a private method
    assert @builder.respond_to?(:field_group_builder, true)
  end

  def test_includes_components
    # generate_label is a private method
    assert @builder.respond_to?(:generate_label, true)
  end

  def test_includes_text_field_input
    assert_respond_to @builder, :text_field
  end

  def test_includes_email_field_input
    assert_respond_to @builder, :email_field
  end

  def test_includes_password_field_input
    assert_respond_to @builder, :password_field
  end

  def test_includes_text_area_input
    assert_respond_to @builder, :text_area
  end

  def test_includes_select_field_input
    assert_respond_to @builder, :select
  end

  def test_includes_check_box_input
    assert_respond_to @builder, :check_box
  end

  def test_includes_radio_button_input
    assert_respond_to @builder, :radio_button
  end

  def test_includes_date_field_input
    assert_respond_to @builder, :date_field
  end

  def test_includes_time_field_input
    assert_respond_to @builder, :time_field
  end

  def test_includes_combobox_field_input
    assert_respond_to @builder, :combobox
  end

  def test_includes_color_field_input
    assert_respond_to @builder, :color_field
  end

  def test_includes_file_field_input
    assert_respond_to @builder, :file_field
  end

  def test_includes_date_time_field_input
    assert_respond_to @builder, :datetime_field
  end
end
