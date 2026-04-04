# frozen_string_literal: true

require_relative "../test_helper"

class DateTimeFieldTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_datetime_input_type
    result = @builder.datetime_field(:created_at)
    assert_match(/type="datetime-local"/, result)
    assert_match(/name="user\[created_at\]"/, result)
  end
end
