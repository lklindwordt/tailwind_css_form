# frozen_string_literal: true

require_relative "../test_helper"

class PasswordFieldTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_password_input_type
    result = @builder.password_field(:password)
    assert_match(/type="password"/, result)
    assert_match(/name="user\[password\]"/, result)
  end

  def test_does_not_include_value_attribute
    result = @builder.password_field(:password)
    refute_match(/value=/, result)
  end

  def test_accepts_autocomplete_option
    result = @builder.password_field(:password, autocomplete: "new-password")
    assert_match(/autocomplete="new-password"/, result)
  end
end
