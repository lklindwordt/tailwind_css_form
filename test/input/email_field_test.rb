# frozen_string_literal: true

require_relative "../test_helper"

class EmailFieldTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_email_input_type
    result = @builder.email_field(:email)
    assert_match(/type="email"/, result)
    assert_match(/name="user\[email\]"/, result)
  end

  def test_applies_field_classes
    result = @builder.email_field(:email)
    assert_match(/class=/, result)
  end

  def test_includes_current_value
    result = @builder.email_field(:email)
    assert_match(/value="john@example.com"/, result)
  end

  def test_accepts_placeholder
    result = @builder.email_field(:email, placeholder: "you@example.com")
    assert_match(/placeholder="you@example.com"/, result)
  end
end
