# frozen_string_literal: true

require_relative "test_helper"

class ConfigurationTest < Minitest::Test
  def setup
    reset_config
    @config = TailwindCssForm::Configuration.new
  end

  def teardown
    reset_config
  end

  def test_has_field_classes_accessor
    @config.field_classes = %w[custom-field-class]
    assert_equal %w[custom-field-class], @config.field_classes
  end

  def test_has_field_error_classes_accessor
    @config.field_error_classes = %w[error-class]
    assert_equal %w[error-class], @config.field_error_classes
  end

  def test_has_field_regular_classes_accessor
    @config.field_regular_classes = %w[regular-class]
    assert_equal %w[regular-class], @config.field_regular_classes
  end

  def test_has_field_disabled_classes_accessor
    @config.field_disabled_classes = %w[disabled-class]
    assert_equal %w[disabled-class], @config.field_disabled_classes
  end

  def test_has_button_classes_accessor
    @config.button_classes = %w[btn btn-primary]
    assert_equal %w[btn btn-primary], @config.button_classes
  end

  def test_has_check_box_classes_accessor
    @config.check_box_classes = %w[checkbox-class]
    assert_equal %w[checkbox-class], @config.check_box_classes
  end

  def test_has_radio_button_classes_accessor
    @config.radio_button_classes = %w[radio-class]
    assert_equal %w[radio-class], @config.radio_button_classes
  end

  def test_has_field_wrapper_classes_accessor
    @config.field_wrapper_classes = %w[wrapper-class]
    assert_equal %w[wrapper-class], @config.field_wrapper_classes
  end

  def test_has_field_error_message_classes_accessor
    @config.field_error_message_classes = %w[error-message-class]
    assert_equal %w[error-message-class], @config.field_error_message_classes
  end

  def test_has_combo_box_button_classes_accessor
    @config.combo_box_button_classes = %w[combo-button]
    assert_equal %w[combo-button], @config.combo_box_button_classes
  end

  def test_has_combo_box_select_list_classes_accessor
    @config.combo_box_select_list_classes = %w[combo-list]
    assert_equal %w[combo-list], @config.combo_box_select_list_classes
  end

  def test_module_configuration
    TailwindCssForm.configure do |c|
      c.field_classes = %w[custom-field]
      c.button_classes = %w[custom-button]
    end

    assert_equal %w[custom-field], TailwindCssForm.config.field_classes
    assert_equal %w[custom-button], TailwindCssForm.config.button_classes
  end

  def test_config_returns_same_instance
    config1 = TailwindCssForm.config
    config2 = TailwindCssForm.config
    assert_same config1, config2
  end

  def test_has_check_box_group_classes_accessor
    @config.check_box_group_classes = %w[checkbox-group]
    assert_equal %w[checkbox-group], @config.check_box_group_classes
  end

  def test_has_check_box_wrapper_classes_accessor
    @config.check_box_wrapper_classes = %w[checkbox-wrapper]
    assert_equal %w[checkbox-wrapper], @config.check_box_wrapper_classes
  end

  def test_has_check_box_label_wrapper_classes_accessor
    @config.check_box_label_wrapper_classes = %w[checkbox-label-wrapper]
    assert_equal %w[checkbox-label-wrapper], @config.check_box_label_wrapper_classes
  end

  def test_has_radio_button_wrapper_classes_accessor
    @config.radio_button_wrapper_classes = %w[radio-wrapper]
    assert_equal %w[radio-wrapper], @config.radio_button_wrapper_classes
  end

  def test_has_field_error_icon_classes_accessor
    @config.field_error_icon_classes = %w[error-icon]
    assert_equal %w[error-icon], @config.field_error_icon_classes
  end

  def test_has_field_error_icon_wrapper_classes_accessor
    @config.field_error_icon_wrapper_classes = %w[error-icon-wrapper]
    assert_equal %w[error-icon-wrapper], @config.field_error_icon_wrapper_classes
  end

  def test_has_rich_text_area_classes_accessor
    @config.rich_text_area_classes = %w[rich-text-class]
    assert_equal %w[rich-text-class], @config.rich_text_area_classes
  end
end
