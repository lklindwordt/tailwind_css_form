# frozen_string_literal: true

require_relative "../test_helper"

class TimeFieldTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_time_input_type
    result = @builder.time_field(:wake_time)
    assert_match(/type="time"/, result)
    assert_match(/name="user\[wake_time\]"/, result)
  end
end
