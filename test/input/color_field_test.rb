# frozen_string_literal: true

require_relative "../test_helper"

class ColorFieldTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_color_input_type
    result = @builder.color_field(:color)
    assert_match(/type="color"/, result)
    assert_match(/name="user\[color\]"/, result)
  end
end
