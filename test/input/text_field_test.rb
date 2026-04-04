# frozen_string_literal: true

require_relative "../test_helper"

class TextFieldTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_text_field
    result = @builder.text_field(:name)
    assert_match(/type="text"/, result)
    assert_match(/name="user\[name\]"/, result)
  end

  def test_applies_field_classes
    result = @builder.text_field(:name)
    assert_match(/class=/, result)
  end

  def test_accepts_custom_placeholder
    result = @builder.text_field(:name, placeholder: "Enter name")
    assert_match(/placeholder="Enter name"/, result)
  end

  def test_includes_label_by_default
    result = @builder.text_field(:name)
    assert_match(/<label/, result)
    assert_match(/Name/, result)
  end

  def test_can_hide_label
    result = @builder.text_field(:name, label: { hide: true })
    assert_match(/hidden/, result)
  end

  def test_accepts_custom_label_text
    result = @builder.text_field(:name, label: "Full Name")
    assert_match(/Full Name/, result)
  end

  def test_shows_validation_errors
    builder_with_errors = form_builder(user_with_errors)
    result = builder_with_errors.text_field(:name)
    assert_match(/aria-invalid="true"/, result)
  end

  def test_includes_current_value
    result = @builder.text_field(:name)
    assert_match(/value="John Doe"/, result)
  end

  def test_accepts_maxlength_option
    result = @builder.text_field(:name, maxlength: 50)
    assert_match(/maxlength="50"/, result)
  end
end
