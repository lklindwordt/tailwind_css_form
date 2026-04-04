# frozen_string_literal: true

require_relative "../test_helper"

class TextAreaTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_textarea_element
    result = @builder.text_area(:bio)
    assert_match(/<textarea/, result)
    assert_match(/name="user\[bio\]"/, result)
  end

  def test_includes_existing_content
    result = @builder.text_area(:bio)
    assert_match(/A sample bio/, result)
  end

  def test_accepts_rows_option
    result = @builder.text_area(:bio, rows: 10)
    assert_match(/rows="10"/, result)
  end

  def test_accepts_cols_option
    result = @builder.text_area(:bio, cols: 50)
    assert_match(/cols="50"/, result)
  end

  def test_accepts_placeholder
    result = @builder.text_area(:bio, placeholder: "Tell us about yourself")
    assert_match(/placeholder="Tell us about yourself"/, result)
  end
end
