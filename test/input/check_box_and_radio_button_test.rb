# frozen_string_literal: true

require_relative "../test_helper"

class CheckBoxTest < Minitest::Test
  def setup
    @builder = form_builder
    TailwindCssForm.configure do |config|
      config.check_box_classes = %w[checkbox-class]
      config.check_box_wrapper_classes = %w[checkbox-wrapper]
      config.check_box_group_classes = %w[checkbox-group]
      config.check_box_label_wrapper_classes = %w[label-wrapper]
    end
  end

  def teardown
    reset_config
  end

  def test_creates_checkbox_input
    result = @builder.check_box(:active)
    assert_match(/type="checkbox"/, result)
    assert_match(/name="user\[active\]"/, result)
  end

  def test_checkbox_has_hidden_field_for_unchecked_value
    result = @builder.check_box(:active)
    assert_match(/type="hidden"/, result)
    assert_match(/value="0"/, result)
  end

  def test_checkbox_wrapped_in_group_div
    result = @builder.check_box(:active)
    assert_match(/checkbox-group/, result)
  end

  def test_checkbox_wrapped_in_wrapper_div
    result = @builder.check_box(:active)
    assert_match(/checkbox-wrapper/, result)
  end

  def test_checkbox_includes_configured_classes
    result = @builder.check_box(:active)
    assert_match(/checkbox-class/, result)
  end

  def test_checkbox_includes_label
    result = @builder.check_box(:active)
    assert_match(/<label/, result)
    assert_match(/Active/, result)
  end

  def test_checkbox_label_wrapped_in_label_wrapper
    result = @builder.check_box(:active)
    assert_match(/label-wrapper/, result)
  end

  def test_checkbox_accepts_custom_checked_value
    result = @builder.check_box(:active, {}, "yes", "no")
    assert_match(/value="yes"/, result)
  end

  def test_checkbox_accepts_custom_unchecked_value
    result = @builder.check_box(:active, {}, "yes", "no")
    assert_match(/value="no"/, result)
  end

  def test_checkbox_with_custom_label
    result = @builder.check_box(:active, label: "Is Active?")
    assert_match(/Is Active\?/, result)
  end

  def test_checkbox_with_custom_group_classes
    result = @builder.check_box(:active, group: { class: "custom-group" })
    assert_match(/custom-group/, result)
  end

  def test_checkbox_merges_custom_classes
    result = @builder.check_box(:active, class: "custom-checkbox")
    assert_match(/custom-checkbox/, result)
    assert_match(/checkbox-class/, result)
  end
end

class RadioButtonTest < Minitest::Test
  def setup
    @builder = form_builder
    TailwindCssForm.configure do |config|
      config.radio_button_classes = %w[radio-class]
      config.radio_button_wrapper_classes = %w[radio-wrapper]
    end
  end

  def teardown
    reset_config
  end

  def test_creates_radio_button_input
    result = @builder.radio_button(:gender, "male")
    assert_match(/type="radio"/, result)
    assert_match(/name="user\[gender\]"/, result)
    assert_match(/value="male"/, result)
  end

  def test_radio_button_includes_configured_classes
    result = @builder.radio_button(:gender, "male")
    assert_match(/radio-class/, result)
  end

  def test_radio_button_wrapped_with_wrapper_classes
    result = @builder.radio_button(:gender, "male")
    assert_match(/radio-wrapper/, result)
  end

  def test_radio_button_includes_label
    result = @builder.radio_button(:gender, "male")
    assert_match(/<label/, result)
    assert_match(/male/, result)
  end

  def test_radio_button_with_custom_label_text
    result = @builder.radio_button(:gender, "male", option: { text: "Male" })
    assert_match(/Male/, result)
  end

  def test_radio_button_uses_value_as_default_label
    result = @builder.radio_button(:gender, "female")
    assert_match(/female/, result)
  end

  def test_radio_button_with_data_attributes
    result = @builder.radio_button(:gender, "male", data: { action: "change->form#submit" })
    # HTML escaping converts -> to -&gt;
    assert_match(/data-action="change-&gt;form#submit"/, result)
  end

  def test_multiple_radio_buttons_with_same_name
    result1 = @builder.radio_button(:gender, "male")
    result2 = @builder.radio_button(:gender, "female")

    assert_match(/value="male"/, result1)
    assert_match(/value="female"/, result2)
    assert_match(/name="user\[gender\]"/, result1)
    assert_match(/name="user\[gender\]"/, result2)
  end
end

class CollectionCheckBoxesTest < Minitest::Test
  def setup
    @builder = form_builder
    @collection = [
      ["Reading", 1],
      ["Writing", 2],
      ["Coding", 3]
    ]
  end

  def test_creates_collection_checkboxes
    skip "Collection checkboxes require Rails helpers"
  end
end

class CollectionRadioButtonsTest < Minitest::Test
  def setup
    @builder = form_builder
    @collection = [
      %w[Admin admin],
      %w[User user],
      %w[Guest guest]
    ]
  end

  def test_creates_collection_radio_buttons
    skip "Collection radio buttons require Rails helpers"
  end
end
